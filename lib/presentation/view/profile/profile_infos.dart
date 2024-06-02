import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/constants/app_assets.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProfileInfosView extends ConsumerStatefulWidget {
  const ProfileInfosView({super.key});

  @override
  ConsumerState createState() => _ProfileInfosViewState();
}

class _ProfileInfosViewState extends ConsumerState<ProfileInfosView> {
  late ProfileViewModel _profileViewModel;
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _genderController;
  late final TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _profileViewModel = ref.read(profileViewModelImp);
    _nameController = TextEditingController(text: _profileViewModel.getUserName);
    _surnameController = TextEditingController(text: _profileViewModel.getUserSurname);
    _emailController = TextEditingController(text: _profileViewModel.getUserEmail);
    _phoneController = TextEditingController(text: _profileViewModel.getUserPhoneNumber);
    _genderController = TextEditingController(text: _profileViewModel.getUserGender);
    _ageController = TextEditingController(text: _profileViewModel.getUserAge);
  }

  @override
  Widget build(BuildContext context) {
    _profileViewModel = ref.watch(profileViewModelImp);
    return Scaffold(
      backgroundColor: AppColors.cascadingWhite,
      appBar: const CustomAppBar(title: LocaleKeys.profile_my_profile_info),
      floatingActionButton: _buildDeleteAccountAndSaveButtons(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Container(
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
                imagePath: _profileViewModel.getUserProfilPhoto,
                padding: context.paddings.allUltra,
                onTap: () {},
              ),
            ),
          ),
          context.sizedBoxHeightMedium,
          Container(
            color: AppColors.whiteColor,
            padding: context.paddings.horizontalMedium + context.paddings.verticalNormal,
            child: Column(
              children: [
                CustomTextFormField(
                  isTitle: true,
                  controller: _nameController,
                  labelText: LocaleKeys.form_fields_name.tr(),
                ),
                context.sizedBoxHeightMedium,
                CustomTextFormField(
                  isTitle: true,
                  controller: _surnameController,
                  labelText: LocaleKeys.form_fields_surname.tr(),
                ),
                context.sizedBoxHeightMedium,
                CustomTextFormField(
                  isTitle: true,
                  controller: _emailController,
                  labelText: LocaleKeys.form_fields_email.tr(),
                ),
                context.sizedBoxHeightMedium,
                CustomTextFormField(
                  isTitle: true,
                  controller: _phoneController,
                  labelText: LocaleKeys.form_fields_phone_number.tr(),
                ),
                context.sizedBoxHeightMedium,
                CustomTextFormField(
                  isTitle: true,
                  prefixIcon: const Icon(Iconsax.man, color: AppColors.blueTang),
                  controller: _genderController,
                  labelText: LocaleKeys.form_fields_gender.tr(),
                ),
                context.sizedBoxHeightMedium,
                CustomTextFormField(
                  isTitle: true,
                  controller: _ageController,
                  labelText: LocaleKeys.form_fields_age.tr(),
                ),
                context.sizedBoxHeightMedium,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildDeleteAccountAndSaveButtons(BuildContext context) {
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
            flex: 2,
            child: CustomElevatedButton(
              padding: context.paddings.verticalNormal,
              textStyle: context.textStyles.titleMedium,
              backgroundColor: AppColors.tomatoFrog,
              onPressed: () {},
              text: LocaleKeys.profile_delete_account.tr(),
            ),
          ),
          context.sizedBoxWidthNormal,
          Expanded(
            flex: 3,
            child: CustomElevatedButton(
              padding: context.paddings.verticalNormal,
              textStyle: context.textStyles.titleMedium,
              onPressed: () {},
              text: LocaleKeys.profile_save.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
