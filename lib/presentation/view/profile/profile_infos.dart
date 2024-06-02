import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/image_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/firebase_service/update_user_info.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
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
  void deactivate() {
    super.deactivate();
    _profileViewModel = ref.read(profileViewModelImp);
    _profileViewModel.deactive();
  }

  @override
  Widget build(BuildContext context) {
    _profileViewModel = ref.watch(profileViewModelImp);
    return Scaffold(
      backgroundColor: AppColors.cascadingWhite,
      appBar: CustomAppBar(title: LocaleKeys.profile_my_profile_info.tr()),
      floatingActionButton: _buildDeleteAccountAndSaveButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _buildBody(),
    );
  }

  /// Body
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProfilPhoto(),
          context.sizedBoxHeightMedium,
          _buildUserInfoFields(),
        ],
      ),
    );
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
          image: AssetImage(AppAssets.linesBg.toPng),
        ),
      ),
      child: Center(
        child: ProfilePhotoWidget(
          imagePath: _profileViewModel.image?.path ?? _profileViewModel.profilPhotoUrl,
          padding: context.paddings.allUltra,
          onTap: () {
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
              removeTap: _profileViewModel.image != null || _profileViewModel.profilPhotoUrl != null
                  ? () {
                      context.pop();
                      _profileViewModel.image = null;
                      _profileViewModel.profilPhotoUrl = null;
                    }
                  : null,
            );
          },
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
      readOnly: !_profileViewModel.isEditing,
      unFocus: true,
      suffixIcon: !_profileViewModel.isEditing ? AppIcons.kLockIcon : null,
      prefixIcon: Icon(prefixIcon, size: 20),
    );
  }

  /// Delete Account And Edit & Save Button
  Widget _buildDeleteAccountAndSaveButtons() {
    return Container(
      padding: context.paddings.horizontalMedium + context.paddings.verticalNormal,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildDeleteIcon(),
          ),
          context.sizedBoxWidthNormal,
          Expanded(
            child: !_profileViewModel.isEditing ? _buildEditIcon() : _buildSaveIcon(),
          ),
        ],
      ),
    );
  }

  /// Save Button
  Widget _buildSaveIcon() {
    return CustomElevatedButton(
      padding: context.paddings.verticalNormal,
      textStyle: context.textStyles.titleMedium,
      onPressed: () => updateProcess(profileViewModel: _profileViewModel),
      text: LocaleKeys.profile_save.tr(),
    );
  }

  /// Edit Button
  Widget _buildEditIcon() {
    return CustomElevatedButton(
      padding: context.paddings.verticalNormal,
      textStyle: context.textStyles.titleMedium,
      onPressed: () {
        _profileViewModel.setIsEditing();
      },
      text: LocaleKeys.profile_edit.tr(),
    );
  }

  /// Delete Button
  Widget _buildDeleteIcon() {
    return CustomElevatedButton(
      padding: context.paddings.verticalNormal,
      textStyle: context.textStyles.titleMedium,
      backgroundColor: AppColors.tomatoFrog,
      onPressed: () {},
      text: LocaleKeys.profile_delete_account.tr(),
    );
  }
}
