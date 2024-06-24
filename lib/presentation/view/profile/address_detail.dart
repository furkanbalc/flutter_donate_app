import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/core/utils/validators.dart/custom_validators.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
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

class AddressDetail extends ConsumerStatefulWidget {
  const AddressDetail({
    super.key,
    required this.address,
    required this.index,
  });

  final AddressEntity address;
  final int index;

  @override
  ConsumerState createState() => _AddAddressState();
}

class _AddAddressState extends ConsumerState<AddressDetail> {
  late AddressViewModel _addressViewModel;

  @override
  void initState() {
    super.initState();
    _addressViewModel = ref.read(addressViewModelImp);
    _addressViewModel.country.text = widget.address.country!;
    _addressViewModel.city.text = widget.address.city!;
    _addressViewModel.county.text = widget.address.county!;
    _addressViewModel.desc.text = widget.address.desc!;
  }

  @override
  void dispose() {
    super.dispose();
    _addressViewModel.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    _addressViewModel = ref.watch(addressViewModelImp);
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
                validator: CustomValidators.emptyValidator,
                labelText: LocaleKeys.address_select_country.tr(),
                readOnly: true,
              ),
            ),
            context.sizedBoxHeightMedium,

            /// City Field
            ProfileInfoTextField(
              controller: _addressViewModel.city,
              validator: CustomValidators.emptyValidator,
              labelText: LocaleKeys.address_select_city.tr(),
              readOnly: true,
              onTap: () {
                selectCityPicker(
                    context: context, addressViewModel: _addressViewModel);
              },
            ),
            context.sizedBoxHeightMedium,

            /// County Field
            ProfileInfoTextField(
                controller: _addressViewModel.county,
                validator: CustomValidators.emptyValidator,
                labelText: LocaleKeys.address_select_district.tr(),
                readOnly: true,
                onTap: () {
                  _addressViewModel.isSelectedCity
                      ? selectCountyPicker(
                          context: context, addressViewModel: _addressViewModel)
                      : Utils.errorSnackBar(
                          context: context,
                          message: 'Şehir seçimi yapmalısınız');
                }),
            context.sizedBoxHeightMedium,
            ProfileInfoTextField(
              controller: _addressViewModel.desc,
              validator: CustomValidators.emptyValidator,
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
    return CustomElevatedButton(
      onPressed: () {
        _addressViewModel.updateAddress(
          addressEntity: AddressEntity(
            country: _addressViewModel.country.text,
            city: _addressViewModel.city.text,
            county: _addressViewModel.county.text,
            desc: _addressViewModel.desc.text,
          ),
          index: widget.index,
        );
      },
      text: 'Güncelle',
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
