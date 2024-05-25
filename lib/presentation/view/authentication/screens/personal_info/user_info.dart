import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/firebase_service/user_info_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/screens/personal_info/gender_info.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/index.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/personal_info/sliver_appbar.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/personal_info/personal_info_viewmodel.dart';
import 'package:flutter_donate_app/presentation/viewmodel/authentication/signup/signup_viewmodel.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoView extends ConsumerStatefulWidget {
  const UserInfoView({super.key});

  @override
  ConsumerState createState() => _UserInfoViewState();
}

class _UserInfoViewState extends ConsumerState<UserInfoView> with UserInfoService{
  late PersonalInfoViewModel _personalInfoViewModel;

  @override
  void initState() {
    _personalInfoViewModel = ref.read(personalInfoViewModelImp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _personalInfoViewModel = ref.watch(personalInfoViewModelImp);
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
        PersonalInfoSliverAppBar(personalInfoViewModel: _personalInfoViewModel),
        SliverToBoxAdapter(
          child: Form(
            key: _personalInfoViewModel.formKey,
            autovalidateMode: _personalInfoViewModel.isCheck ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              child: Column(
                children: [
                  context.sizedBoxHeightHigh,

                  /// User Info Title
                  AuthHeader(
                    title: LocaleKeys.user_info_complete_your_profile.tr(),
                    subTitle: LocaleKeys.auth_fill_your_info.tr(),
                  ),
                  context.sizedBoxHeightHigh,

                  /// Add Profile Photo
                  ProfilePhotoWidget(
                    onTap: () {},
                  ),
                  context.sizedBoxHeightHigh,

                  /// User Info Forms
                  _getFormFields(),
                  SizedBox(height: context.dynamicHeight(.2)),
                ],
              ),
            ),
          ),
        ),
      ],
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
                validator: (p0) => _personalInfoViewModel.nameValidation(),
                onChanged: _personalInfoViewModel.setName,
                labelText: LocaleKeys.form_fields_name.tr(),
                hintText: LocaleKeys.form_fields_name.tr(),
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.username],
                textInputAction: TextInputAction.next,
              ),
            ),
            context.sizedBoxWidthLow,

            /// Surname Field
            Expanded(
              child: CustomTextFormField(
                validator: (p0) => _personalInfoViewModel.surnameValidation(),
                onChanged: _personalInfoViewModel.setSurname,
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
        context.sizedBoxHeightHigh,

        /// Phone Number Field
        CustomIntlPhoneNumberInput(
          onChanged: _personalInfoViewModel.setPhoneNumber,
        ),
      ],
    );
  }

  /// Apply Button
  Widget _getApplyButton(BuildContext context) {
    return AuthBottomButton(
      onPressed: _personalInfoViewModel.emptyCheck()
          ? () => userInfoProcess(personalInfoViewModel: _personalInfoViewModel)
          : null,
    );
  }
}

