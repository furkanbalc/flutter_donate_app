import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/index.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/mixin/validator.dart';
import 'package:flutter_donate_app/core/router/route_names.dart';
import 'package:flutter_donate_app/core/utils/custom_alert_dialog.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/age_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/core/utils/are_you_sure_dialog.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/gender_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/core/utils/image_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/mixin/update_user_info_service.dart';
import 'package:flutter_donate_app/presentation/view/authentication/widgets/auth/auth_bottom_button.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/profile_info_text_field.dart';
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

class _ProfileInfosViewState extends ConsumerState<ProfileInfosView> with UpdateUserInfoService, Validator {
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
        backgroundColor: AppColors.cascadingWhite,
        appBar: CustomAppBar(title: LocaleKeys.profile_my_profile_info.tr()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        Form(
          key: _profileViewModel.formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Column(
              children: [
                _buildProfilPhoto(),
                context.sizedBoxHeightMedium,
                _buildUserInfoFields(),
              ],
            ),
          ),
        ),
        _builDeleteAccountAndSaveButton()
      ],
    );
  }

  /// Save & Delete Account Button
  Widget _builDeleteAccountAndSaveButton() {
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

  /// Profil Photo Widget
  Widget _buildProfilPhoto() {
    return Container(
      width: context.dynamicWidth(),
      padding: context.paddings.verticalNormal,
      margin: context.paddings.onlyTopNormal,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(AppColors.electricViolet.withOpacity(.5), BlendMode.srcIn),
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
          /// Name Field
          ProfileInfoTextField(
            controller: _profileViewModel.nameController,
            validator: nameValidator,
            labelText: LocaleKeys.form_fields_name.tr(),
            prefixIcon: AppIcons.kUserOutlinedIcon,
          ),
          context.sizedBoxHeightMedium,

          /// SurName Field
          ProfileInfoTextField(
            controller: _profileViewModel.surnameController,
            validator: surnameValidator,
            labelText: LocaleKeys.form_fields_surname.tr(),
            prefixIcon: AppIcons.kUserOutlinedIcon,
          ),
          context.sizedBoxHeightMedium,

          /// Email Field
          ProfileInfoTextField(
            controller: _profileViewModel.emailController,
            validator: emailValidator,
            labelText: LocaleKeys.form_fields_email.tr(),
            prefixIcon: AppIcons.kEmailIcon,
          ),
          context.sizedBoxHeightMedium,

          /// Phone Number Field
          ProfileInfoTextField(
            controller: _profileViewModel.phoneController,
            validator: phoneNumberValidator,
            labelText: LocaleKeys.form_fields_phone_number.tr(),
            prefixIcon: AppIcons.kPhoneIcon,
            keyboardType: TextInputType.phone,
          ),
          context.sizedBoxHeightMedium,

          /// Gender Field
          ProfileInfoTextField(
            controller: _profileViewModel.genderController,
            labelText: LocaleKeys.form_fields_gender.tr(),
            prefixIcon: _profileViewModel.genderIcon,
            onTap: () async {
              genderPickerSheet(
                context: context,
                profileViewModel: _profileViewModel,
              );
            },
            readOnly: true,
          ),
          context.sizedBoxHeightMedium,

          /// Age Field
          ProfileInfoTextField(
            controller: _profileViewModel.ageController,
            labelText: LocaleKeys.form_fields_age.tr(),
            prefixIcon: AppIcons.kUserOutlinedIcon,
            onTap: () async {
              agePickerBottomSheet(
                context: context,
                profileViewModel: _profileViewModel,
              );
            },
            readOnly: true,
          ),
        ],
      ),
    );
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
      backgroundColor: AppColors.greyLight,
      onPressed: () {
        customAlertDialog(
          context: context,
          title: 'Emin misin',
          message: 'Hesabın silinecek ve tüm verilerin tarih olacak!',
          onPressed: () {
            context.pop();
            _profileViewModel.deleteAccount().then((value) {
              if (_profileViewModel.deleteAccountResponse.isCompleted()) {
                context.goNamed(AppRouteName.welcome.name);
                Utils.successSnackBar(
                  context: context,
                  message: 'Hesabınız başarıyla silindi',
                );
              } else {
                Utils.errorSnackBar(
                  context: context,
                  message: 'Hesabınız silinemedi tekrar deneyiniz',
                );
              }
            });
          },
        );
      },
      text: LocaleKeys.profile_delete_account.tr(),
    );
  }

  /// Body Error Status
  Widget _buildError() {
    return CustomErrorWidget(
      onPressed: () {
        _profileViewModel.getUserInfoFromFirestore(id: _profileViewModel.getUserId);
      },
    );
  }
}
