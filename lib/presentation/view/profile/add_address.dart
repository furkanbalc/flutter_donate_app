import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/constants/app_colors.dart';
import 'package:flutter_donate_app/core/constants/app_icons.dart';
import 'package:flutter_donate_app/core/enums/app_sizes.dart';
import 'package:flutter_donate_app/core/extensions/context_padding.dart';
import 'package:flutter_donate_app/core/extensions/context_sizedbox.dart';
import 'package:flutter_donate_app/core/mixin/validator.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/main.dart';
import 'package:flutter_donate_app/presentation/view/profile/location_page.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/pickers/city_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/pickers/county_picker_bottom_sheet.dart';
import 'package:flutter_donate_app/presentation/view/profile/widgets/profile_info_text_field.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:flutter_donate_app/presentation/widgets/appbar/custom_appbar.dart';
import 'package:flutter_donate_app/presentation/widgets/index.dart';
import 'package:flutter_donate_app/presentation/widgets/progress/custom_error_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AddAddress extends ConsumerStatefulWidget {
  const AddAddress({super.key});

  @override
  ConsumerState createState() => _AddAddressState();
}

class _AddAddressState extends ConsumerState<AddAddress> with Validator {
  late AddressViewModel _addressViewModel;


  @override
  void initState() {
    super.initState();
    _addressViewModel = ref.read(addressViewModelImp);
  }

  @override
  Widget build(BuildContext context) {
    _addressViewModel = ref.watch(addressViewModelImp);
    return Scaffold(
      backgroundColor: AppColors.cascadingWhite,
      appBar: const CustomAppBar(title: 'Adres Ekle'),
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
                labelText: 'Ülke',
                readOnly: true,
              ),
            ),
            context.sizedBoxHeightMedium,

            /// City Field
            ProfileInfoTextField(
              controller: _addressViewModel.city,
              validator: provinceValidator,
              labelText: 'İl',
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
                labelText: 'İlçe',
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
              labelText: 'Açıklama',
              maxLines: 4,
              minLines: 1,
            ),
            context.sizedBoxHeightMedium,
            CustomElevatedButton(
              onPressed: () {
                if (_addressViewModel.formKey.currentState != null &&
                    _addressViewModel.formKey.currentState!.validate()) {}
              },
              text: 'Adres Ekle',
            ),
            TextButton.icon(
              onPressed: () {
                _getCurrentPosition;
              },
              icon: Icon(AppIcons.kLocationFilledIcon,size: AppSizes.high.value),
              label: const Text(
                'Mevcut Konumu Kullan',
              ),
            ),
          ],
        ),
      ),
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
