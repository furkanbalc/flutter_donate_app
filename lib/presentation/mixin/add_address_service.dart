import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/extensions/index.dart';
import 'package:flutter_donate_app/core/router/index.dart';
import 'package:flutter_donate_app/core/utils/utils.dart';
import 'package:flutter_donate_app/presentation/view/profile/add_address.dart';
import 'package:flutter_donate_app/presentation/viewmodel/index.dart';
import 'package:go_router/go_router.dart';

mixin AddAddressService on State<AddAddress> {
  void addAddressProcess({
    required BuildContext context,
    required AddressViewModel addressViewModel,
    required String userId,
  }) {
    if (addressViewModel.formKey.currentState != null && addressViewModel.formKey.currentState!.validate()) {
      addressViewModel.addAdressesToFirestore().then((value) {
        if (addressViewModel.addAddressToFirestoreResponse.isCompleted()) {
          addressViewModel.getAdressesFromFirestore(id: userId);
          Utils.successSnackBar(context: context, message: 'Adres Eklendi');
          context.goNamed(AppRouteName.addressInfos.name);
        } else {
          Utils.errorSnackBar(context: context, message: 'Adres ekleme başarısız');
        }
      });
    }
  }
}
