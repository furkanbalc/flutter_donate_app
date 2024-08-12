import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/custom_image_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/mixin/user_info_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/index.dart';
import 'package:flutter_donate_app/presentation/view/user_info/widgets/sliver_appbar.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoView extends ConsumerStatefulWidget {
  const UserInfoView({super.key});

  @override
  ConsumerState createState() => _UserInfoViewState();
}

class _UserInfoViewState extends ConsumerState<UserInfoView> with UserInfoService {
  late UserInfoViewModel _userInfoViewModel;

  @override
  void initState() {
    _userInfoViewModel = ref.read(personalInfoViewModelImp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _userInfoViewModel = ref.watch(personalInfoViewModelImp);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AuthBody(child: _buildBody(context)),
      floatingActionButton: _getApplyButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  /// Body
  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// Linear Progress Bar
        UserInfoSliverAppBar(userInfoViewModel: _userInfoViewModel),

        /// Form Fields
        SliverToBoxAdapter(child: _buildFormFields(context)),
      ],
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return Form(
      key: _userInfoViewModel.formKey,
      autovalidateMode: _userInfoViewModel.isCheck ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Column(
          children: [
            context.sizedBoxHeightMedium2,

            /// User Info Title
            AuthHeader(
              title: LocaleKeys.user_info_complete_your_profile.tr(),
              subTitle: LocaleKeys.auth_fill_your_info.tr(),
            ),
            context.sizedBoxHeightMedium2,

            /// Add Profile Photo
            _buildAddProfilePhoto(context),
            context.sizedBoxHeightMedium2,

            /// User Info Forms
            _getFormFields(),
            SizedBox(height: context.dynamicHeight(.2)),
          ],
        ),
      ),
    );
  }

  /// Add Profile Photo
  Widget _buildAddProfilePhoto(BuildContext context) {
    return ProfilePhotoWidget(
      imagePath: _userInfoViewModel.image?.path,
      onTap: () {
        customImagePickerBottomSheet(
          context: context,
          cameraTap: () {
            Navigator.pop(context);
            _userInfoViewModel.getImageFromCamera();
          },
          galleryTap: () {
            Navigator.pop(context);
            _userInfoViewModel.getImageFromGallery();
          },
          removeTap: _userInfoViewModel.image != null ? () => _userInfoViewModel.pickImageRemove(context: context) : null,
        );
      },
    );
  }

  /// Form Fields
  Widget _getFormFields() {
    return Column(
      children: [
        Row(
          children: [
            /// Name Field
            Expanded(
              child: CustomTextFormField(
                validator: (p0) => _userInfoViewModel.nameValidation(),
                onChanged: _userInfoViewModel.setName,
                labelText: LocaleKeys.form_fields_name.tr(),
                hintText: LocaleKeys.form_fields_name.tr(),
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.username],
                textInputAction: TextInputAction.next,
              ),
            ),
            context.sizedBoxWidthLow2,

            /// Surname Field
            Expanded(
              child: CustomTextFormField(
                validator: (p0) => _userInfoViewModel.surnameValidation(),
                onChanged: _userInfoViewModel.setSurname,
                labelText: LocaleKeys.form_fields_surname.tr(),
                hintText: LocaleKeys.form_fields_surname.tr(),
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.username],
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
              ),
            ),
          ],
        ),
        context.sizedBoxHeightMedium2,

        /// Phone Number Field
        CustomIntlPhoneNumberInput(
          onChanged: _userInfoViewModel.setPhoneNumber,
        ),
      ],
    );
  }

  /// Apply Button
  Widget _getApplyButton(BuildContext context) {
    return AuthBottomButton(
      onPressed: _userInfoViewModel.emptyCheck() ? () => userInfoProcess(userInfoViewModel: _userInfoViewModel) : null,
    );
  }
}
