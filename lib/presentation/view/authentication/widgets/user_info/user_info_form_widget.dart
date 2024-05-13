part of '../../screens/user_info/user_info.dart';

class UserInfoFormWidget extends StatefulWidget {
  const UserInfoFormWidget({super.key});

  @override
  State<UserInfoFormWidget> createState() => _UserInfoFormWidgetState();
}

class _UserInfoFormWidgetState extends State<UserInfoFormWidget> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddings.verticalNormal,

      /// User Info Forms
      child: _buildForms(context),
    );
  }

  Widget _buildForms(BuildContext context) {
    return Column(
      children: [
        /// Name Field
        CustomTextFormField(
          controller: _nameController,
          labelText: LocaleKeys.form_fields_name.tr(),
          hintText: LocaleKeys.form_fields_name.tr(),
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.username],
          textInputAction: TextInputAction.next,
        ),
        context.sizedBoxHeightMedium,

        /// Surname Field
        CustomTextFormField(
          controller: _surnameController,
          labelText: LocaleKeys.form_fields_surname.tr(),
          hintText: LocaleKeys.form_fields_surname.tr(),
          keyboardType: TextInputType.name,
          autofillHints: const [AutofillHints.username],
          textInputAction: TextInputAction.next,
        ),
        context.sizedBoxHeightMedium,

        /// Phone Number Field
        CustomIntlPhoneNumberInput(
          controller: _phoneNumberController,
        ),

        context.sizedBoxHeightCustom,

        /// Apply Button
        CustomElevatedButton(
          onPressed: () {},
          text: LocaleKeys.auth_apply_and_continue.tr(),
        ),
      ],
    );
  }
}
