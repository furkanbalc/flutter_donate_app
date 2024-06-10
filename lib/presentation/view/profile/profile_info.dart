import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/index.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/mixin/validator.dart';
import 'package:flutter_donate_app/core/utils/custom_alert_dialog.dart';
import 'package:flutter_donate_app/core/utils/custom_back_dialog.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/mixin/delete_account_service.dart';
import 'package:flutter_donate_app/presentation/mixin/update_user_info_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/index.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/pickers/index.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/profile/profile_info_text_field.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_error_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer/custom_profile_shimmer.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'widgets/profile/profile_info_profil_photo.dart';

part 'widgets/profile/profile_info_text_fields.dart';

class ProfileInfoView extends ConsumerStatefulWidget {
  const ProfileInfoView({super.key});

  @override
  ConsumerState createState() => _ProfileInfosViewState();
}

class _ProfileInfosViewState extends ConsumerState<ProfileInfoView> with UpdateUserInfoService, DeleteAccountService {
  late ProfileViewModel _profileViewModel;

  @override
  void initState() {
    super.initState();
    _profileViewModel = ref.read(profileViewModelImp);
    _profileViewModel.init();
  }

  void _onPopInvoked(bool value) {
    if (value) {
      return;
    }

    /// kaydedilmeyen degisiklik yoksa geri gidebilir
    if (!_profileViewModel.isChangesSaved()) {
      context.pop();
    } else {
      /// kaydedilmeyen degisiklik varsa
      showBackDialog(
        context: context,

        /// kaydedilmeyen degisiklik varsa ve devam et denildiyse degisiklikler geri alinir
        continuePress: () {
          _profileViewModel.undoUnsavedChanges();
          context.pop();
          context.pop();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _profileViewModel = ref.watch(profileViewModelImp);
    return PopScope(
      canPop: false,
      onPopInvoked: _onPopInvoked,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.cascadingWhite,
        appBar: CustomAppBar(title: LocaleKeys.profile_my_profile_info.tr()),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    switch (_profileViewModel.getUserInfoFromFirestoreResponse.status) {
      case Status.loading:
        return const CustomProfileInfoShimmer();
      case Status.completed:
        return _buildCompleted();
      case Status.error:
        return _buildError();
      default:
        return const SizedBox();
    }
  }

  /// Body Completed Status
  Widget _buildCompleted() {
    return Stack(
      children: [
        Column(
          children: [
            /// User Profile Photo
            ProfileInfoProfilePhoto(profileViewModel: _profileViewModel),
            context.sizedBoxHeightMedium,

            /// User Info Text Fields
            ProfileInfoTextFields(profileViewModel: _profileViewModel),
          ],
        ),
        _bottomButtons(),
      ],
    );
  }

  /// Delete Account & Save Buttons
  Widget _bottomButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AuthBottomButton(
        child: Row(
          children: [
            Expanded(child: _buildDeleteButton()),
            context.sizedBoxWidthNormal,
            Expanded(child: _buildSaveButton()),
          ],
        ),
      ),
    );
  }

  /// Save Button
  Widget _buildSaveButton() {
    return CustomElevatedButton(
      padding: context.paddings.verticalNormal,
      onPressed: () => updateProcess(
        context: context,
        profileViewModel: _profileViewModel,
      ),
      text: LocaleKeys.profile_save.tr(),
    );
  }

  /// Delete Button
  Widget _buildDeleteButton() {
    return CustomElevatedButton(
      padding: context.paddings.verticalNormal,
      backgroundColor: AppColors.greyLight,
      onPressed: () {
        customAlertDialog(
          context: context,
          title: 'Emin misin',
          message: 'Hesabın silinecek ve tüm verilerin tarih olacak!',
          onPressed: () => deleteAccountProcess(context: context, profileViewModel: _profileViewModel),
        );
      },
      text: LocaleKeys.profile_delete_account.tr(),
    );
  }

  /// Error Widget
  Widget _buildError() {
    return CustomErrorWidget(
      onPressed: () {
        _profileViewModel.getUserInfoFromFirestore(id: _profileViewModel.getUserId);
      },
    );
  }
}
