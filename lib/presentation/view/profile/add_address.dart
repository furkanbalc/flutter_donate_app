import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/mixin/validator.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/pickers/city_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/pickers/county_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/profile/profile_info_text_field.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_error_widget.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddAddress extends ConsumerStatefulWidget {
  const AddAddress({super.key});

  @override
  ConsumerState createState() => _AddAddressState();
}

class _AddAddressState extends ConsumerState<AddAddress> with Validator {
  late AddressViewModel _addressViewModel;
  late ProfileViewModel _profileViewModel;

  @override
  void initState() {
    super.initState();
    _addressViewModel = ref.read(addressViewModelImp);
    _profileViewModel = ref.read(profileViewModelImp);
  }

  @override
  void dispose() {
    super.dispose();
    _addressViewModel.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    _addressViewModel = ref.watch(addressViewModelImp);
    _profileViewModel = ref.watch(profileViewModelImp);
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.address_add_address.tr()),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_addressViewModel.getTrProvincesResponse.status) {
      case Status.loading:
        return const CustomLoadingWidget();
      case Status.completed:
        return _buildAddressInputFields();
      case Status.error:
        return _errorWidget();
      default:
        return context.sizedBoxShrink;
    }
  }

  /// Inputs of Addresses
  Widget _buildAddressInputFields() {
    return Form(
      key: _addressViewModel.formKey,
      child: Padding(
        padding: context.paddings.allNormal,
        child: Column(
          children: [
            /// Country Field
            AbsorbPointer(
              child: ProfileInfoTextField(
                controller: _addressViewModel.country,
                validator: provinceValidator,
                labelText: LocaleKeys.address_select_country.tr(),
                readOnly: true,
              ),
            ),
            context.sizedBoxHeightMedium,

            /// City Field
            ProfileInfoTextField(
              controller: _addressViewModel.city,
              validator: provinceValidator,
              labelText: LocaleKeys.address_select_city.tr(),
              readOnly: true,
              onTap: () {
                selectCityPicker(context: context, addressViewModel: _addressViewModel);
              },
            ),
            context.sizedBoxHeightMedium,

            /// County Field
            ProfileInfoTextField(
                controller: _addressViewModel.county,
                validator: provinceValidator,
                labelText: LocaleKeys.address_select_district.tr(),
                readOnly: true,
                onTap: () {
                  _addressViewModel.isSelectedCity
                      ? selectCountyPicker(context: context, addressViewModel: _addressViewModel)
                      : Utils.errorSnackBar(context: context, message: 'Şehir seçimi yapmalısınız');
                }),
            context.sizedBoxHeightMedium,
            ProfileInfoTextField(
              controller: _addressViewModel.desc,
              validator: provinceValidator,
              labelText: LocaleKeys.address_description.tr(),
              maxLines: 4,
              minLines: 1,
            ),
            context.sizedBoxHeightMedium,
            _buildAddrees(),
          ],
        ),
      ),
    );
  }

  /// Add Address & Use Current Position Button
  Widget _buildAddrees() {
    return Column(
      children: [
        CustomElevatedButton(
          onPressed: () {
            if (_addressViewModel.formKey.currentState != null && _addressViewModel.formKey.currentState!.validate()) {
              _addressViewModel.addAdressesToFirestore().then((value) {
                if (_addressViewModel.addAddressToFirestoreResponse.isCompleted()) {
                  _addressViewModel.getAdressesFromFirestore(id: _profileViewModel.getUserId);
                  Utils.successSnackBar(context: context, message: 'Adresiniz Eklendi');
                  context.goNamed(AppRouteName.profile.name);
                } else {
                  Utils.errorSnackBar(context: context, message: 'Adres ekleme başarısız');
                }
              });
            }
          },
          text: LocaleKeys.address_add_address.tr(),
        ),
        TextButton.icon(
          onPressed: () {
            _addressViewModel.getCurrentPosition();
          },
          icon: Icon(AppIcons.kLocationFilledIcon, size: AppSizes.high.value),
          label: Text(
            LocaleKeys.address_use_current_location.tr(),
          ),
        ),
      ],
    );
  }

  /// Error Widget
  Widget _errorWidget() {
    return CustomErrorWidget(
      onPressed: () {
        _addressViewModel.getProvinces();
      },
    );
  }
}
