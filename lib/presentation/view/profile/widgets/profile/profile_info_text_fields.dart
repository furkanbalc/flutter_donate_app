part of '../../profile_info.dart';

class ProfileInfoTextFields extends StatefulWidget {
  const ProfileInfoTextFields({super.key, required this.profileViewModel});

  final ProfileViewModel profileViewModel;

  @override
  State<ProfileInfoTextFields> createState() => _ProfileInfoTextFieldsState();
}

class _ProfileInfoTextFieldsState extends State<ProfileInfoTextFields> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.profileViewModel.formKey,
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: Column(
          children: [
            Container(
              color: AppColors.whiteColor,
              padding: context.paddings.horizontalMedium1 +
                  context.paddings.verticalLow3,
              child: Column(
                children: [
                  /// Name Field
                  ProfileInfoTextField(
                    controller: widget.profileViewModel.nameController,
                    validator: CustomValidators.nameValidator,
                    labelText: LocaleKeys.form_fields_name.tr(),
                    prefixIcon: AppIcons.kUserOutlinedIcon,
                  ),
                  context.sizedBoxHeightMedium1,

                  /// SurName Field
                  ProfileInfoTextField(
                    controller: widget.profileViewModel.surnameController,
                    validator: CustomValidators.surnameValidator,
                    labelText: LocaleKeys.form_fields_surname.tr(),
                    prefixIcon: AppIcons.kUserOutlinedIcon,
                  ),
                  context.sizedBoxHeightMedium1,

                  /// Email Field
                  ProfileInfoTextField(
                    controller: widget.profileViewModel.emailController,
                    validator: CustomValidators.emailValidator,
                    labelText: LocaleKeys.form_fields_email.tr(),
                    prefixIcon: AppIcons.kEmailIcon,
                  ),
                  context.sizedBoxHeightMedium1,

                  /// Phone Number Field
                  ProfileInfoTextField(
                    controller: widget.profileViewModel.phoneController,
                    validator: CustomValidators.phoneNumberValidator,
                    labelText: LocaleKeys.form_fields_phone_number.tr(),
                    prefixIcon: AppIcons.kMobilePhoneIcon,
                    keyboardType: TextInputType.phone,
                  ),
                  context.sizedBoxHeightMedium1,

                  /// Gender Field
                  ProfileInfoTextField(
                    controller: widget.profileViewModel.genderController,
                    labelText: LocaleKeys.form_fields_gender.tr(),
                    prefixIcon: widget.profileViewModel.genderIcon,
                    onTap: () async {
                      genderPickerBottomSheet(
                        context: context,
                        profileViewModel: widget.profileViewModel,
                      );
                    },
                    readOnly: true,
                  ),
                  context.sizedBoxHeightMedium1,

                  /// Age Field
                  ProfileInfoTextField(
                    controller: widget.profileViewModel.ageController,
                    labelText: LocaleKeys.form_fields_age.tr(),
                    prefixIcon: AppIcons.kUserOutlinedIcon,
                    onTap: () async {
                      agePickerBottomSheet(
                        context: context,
                        profileViewModel: widget.profileViewModel,
                      );
                    },
                    readOnly: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
