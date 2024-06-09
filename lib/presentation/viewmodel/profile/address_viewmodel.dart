import 'package:flutter/cupertino.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/address_entity.dart';

abstract class AddressViewModel extends ChangeNotifier {
  /// VARIABLES
  bool get isDeleteMode;

  bool get isAllSelected;

  List<bool> get isCheckedList;

  set isDeleteMode(bool value);

  set isCheckedList(List<bool> value);

  set isAllSelected(bool value);

  /// METHODS
  ///
  ///  -- GET ADDRESS INFO --
  ApiResponse<AddressesEntity> get getAddressFromFirestoreResponse;

  set getAddressFromFirestoreResponse(ApiResponse<AddressesEntity> value);

  Future<void> getAdressesFromFirestore({required String id});

  ///  -- ADD ADDRESS INFO --
  ApiResponse<AddressesEntity> get addAddressToFirestoreResponse;

  set addAddressToFirestoreResponse(ApiResponse<AddressesEntity> value);

  Future<void> addAdressesToFirestore({
    required String country,
    required String city,
    required String town,
    required String desc,
    required String lat,
    required String long,
  });

  /// init method
  void init();
  /// get address city & town
  String getAddressTitle(int index);

  /// get address desc
  String getAddressDesc(int index);

  /// select all addresses
  void selectAllAddress();

  /// address delete mode on
  void deleteModeOn();

  /// address delete mode off
  void deleteModeOff();
}
