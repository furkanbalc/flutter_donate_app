import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/core/utils/are_you_sure_dialog.dart';
import 'package:flutter_donate_app/core/utils/custom_alert_dialog.dart';
import 'package:flutter_donate_app/core/utils/image_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/firebase_service/update_user_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_error_widget.dart';
import 'package:flutter_donate_app/presentation/widgets/shimmer/custom_profile_shimmer.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileInfosView extends ConsumerStatefulWidget {
  const ProfileInfosView({super.key});

  @override
  ConsumerState createState() => _ProfileInfosViewState();
}

class _ProfileInfosViewState extends ConsumerState<ProfileInfosView> with UpdateUserInfo {
  late ProfileViewModel _profileViewModel;

  @override
  void initState() {
    super.initState();
    _profileViewModel = ref.read(profileViewModelImp);
    _profileViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    _profileViewModel = ref.watch(profileViewModelImp);
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }
        if (!_profileViewModel.isChangesSaved()) {
          Navigator.pop(context);
        } else {
          showBackDialog(
            context: context,
            continuePress: () {
              _profileViewModel.undoUnsavedChanges();
              Navigator.pop(context);
              Navigator.pop(context);
            },
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar(title: LocaleKeys.profile_my_profile_info.tr()),
        floatingActionButton: _buildDeleteAccountAndSaveButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _buildBody(),
      ),
    );
  }

  /// Body
  Widget _buildBody() {
    switch (_profileViewModel.getUserInfoFromFirestoreResponse.status) {
      case Status.loading:
        return const CustomProfileInfoShimmer();
      case Status.completed:
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildProfilPhoto(),
              context.sizedBoxHeightMedium,
              _buildUserInfoFields(),
            ],
          ),
        );
      case Status.error:
        return CustomErrorWidget(
          onPressed: () {
            _profileViewModel.getUserInfoFromFirestore(id: _profileViewModel.getUserId);
          },
        );

      default:
        return const SizedBox();
    }
  }

  /// Profil Photo Widget
  Widget _buildProfilPhoto() {
    return Container(
      width: context.dynamicWidth(),
      padding: context.paddings.verticalNormal,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(AppColors.electricViolet.withOpacity(.3), BlendMode.srcIn),
          image: AssetImage(AppPng.linesBg.toPng),
        ),
      ),
      child: Center(
        child: ProfilePhotoWidget(
          imagePath: _profileViewModel.profilPhotoUrl,
          padding: context.paddings.allUltra,
          onTap: _profileViewModel.isEditing
              ? () {
                  imagePickerBottomSheet(
                    context: context,
                    cameraTap: () async {
                      context.pop();
                      _profileViewModel.getImageFromCamera();
                    },
                    galleryTap: () async {
                      context.pop();
                      _profileViewModel.getImageFromGallery();
                    },
                    removeTap: _profileViewModel.profilPhotoUrl != null || _profileViewModel.profilPhotoUrl != ''
                        ? () {
                            _profileViewModel.profilPhotoUrl = null;
                            context.pop();
                          }
                        : null,
                  );
                }
              : null,
        ),
      ),
    );
  }

  /// User Info Fields
  Widget _buildUserInfoFields() {
    return Container(
      color: AppColors.whiteColor,
      padding: context.paddings.horizontalMedium + context.paddings.verticalNormal,
      child: Column(
        children: [
          _buildProfileInfoField(
            controller: _profileViewModel.nameController,
            label: LocaleKeys.form_fields_name.tr(),
            prefixIcon: AppIcons.kUserOutlinedIcon,
          ),
          context.sizedBoxHeightMedium,
          _buildProfileInfoField(
            controller: _profileViewModel.surnameController,
            label: LocaleKeys.form_fields_surname.tr(),
            prefixIcon: AppIcons.kUserOutlinedIcon,
          ),
          context.sizedBoxHeightMedium,
          _buildProfileInfoField(
            controller: _profileViewModel.emailController,
            label: LocaleKeys.form_fields_email.tr(),
            prefixIcon: AppIcons.kEmailIcon,
          ),
          context.sizedBoxHeightMedium,
          _buildProfileInfoField(
            controller: _profileViewModel.phoneController,
            label: LocaleKeys.form_fields_phone_number.tr(),
            prefixIcon: AppIcons.kPhoneIcon,
          ),
          context.sizedBoxHeightMedium,
          _buildProfileInfoField(
            controller: _profileViewModel.genderController,
            label: LocaleKeys.form_fields_gender.tr(),
            prefixIcon: _profileViewModel.getUserGenderIcon,
          ),
          context.sizedBoxHeightMedium,
          _buildProfileInfoField(
            controller: _profileViewModel.ageController,
            label: LocaleKeys.form_fields_age.tr(),
            prefixIcon: AppIcons.kUserOutlinedIcon,
          ),
        ],
      ),
    );
  }

  /// Delete Account And Edit & Save Button
  Widget _buildDeleteAccountAndSaveButtons() {
    switch (_profileViewModel.getUserInfoFromFirestoreResponse.status) {
      case Status.completed:
        return AuthBottomButton(
          child: Row(
            children: [
              Expanded(child: _buildDeleteButton()),
              context.sizedBoxWidthNormal,
              Expanded(child: _buildSaveButton()),
            ],
          ),
        );
      case Status.error:
        return context.sizedBoxShrink;
      default:
        return context.sizedBoxShrink;
    }
  }

  /// Save Button
  Widget _buildSaveButton() {
    return CustomElevatedButton(
      padding: context.paddings.verticalNormal,
      textStyle: context.textStyles.titleMedium,
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
      textStyle: context.textStyles.titleMedium,
      backgroundColor: AppColors.tomatoFrog,
      onPressed: () {},
      text: LocaleKeys.profile_delete_account.tr(),
    );
  }

  /// Edit Button // FIXME
// Widget _buildEditButton() {
//   return CustomElevatedButton(
//     padding: context.paddings.verticalNormal,
//     textStyle: context.textStyles.titleMedium,
//     onPressed: () {
//       _profileViewModel.setIsEditing();
//     },
//     text: LocaleKeys.profile_edit.tr(),
//   );
// }

  /// Text Form Field
  Widget _buildProfileInfoField({
    required TextEditingController controller,
    required String label,
    required IconData prefixIcon,
  }) {
    return CustomTextFormField(
      isTitle: true,
      controller: controller,
      labelText: label,
      // readOnly: !_profileViewModel.isEditing,
      unFocus: true,
      // suffixIcon: !_profileViewModel.isEditing ? AppIcons.kLockIcon : null,// FIXME
      prefixIcon: Icon(prefixIcon, size: 20),
    );
  }
}
