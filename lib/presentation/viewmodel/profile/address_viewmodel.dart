import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';
import 'package:geolocator/geolocator.dart';

abstract class AddressViewModel extends ChangeNotifier {
  /// VARIABLES
  GlobalKey<FormState> get formKey;

  TextEditingController get country;

  TextEditingController get city;

  TextEditingController get county;

  TextEditingController get desc;

  TextEditingController get search;

  Position? get currentPosition;

  String? get currentAddress;

  int get selectedCityIndex;

  int get selectedCountyIndex;

  set selectedCityIndex(int value);

  set selectedCountyIndex(int value);

  /// METHODS
  ///
  ///  -- GET ADDRESS INFO --
  ApiResponse<AddressesEntity> get getAddressFromFirestoreResponse;

  set getAddressFromFirestoreResponse(ApiResponse<AddressesEntity> value);

  Future<void> getAdressesFromFirestore({required String id});

  ///  -- ADD ADDRESS INFO --
  ApiResponse<AddressesEntity> get addAddressToFirestoreResponse;

  set addAddressToFirestoreResponse(ApiResponse<AddressesEntity> value);

  Future<void> addAdressesToFirestore();

  ///  -- DELETE ADDRESS INFO --
  ApiResponse<void> get deleteAddressResponse;

  set deleteAddressResponse(ApiResponse<void> value);

  Future<void> deleteAddress({required List<int> deleteAddressIndices});

  ///  -- UPDATE ADDRESS INFO --
  ApiResponse<void> get updateAddressResponse;

  set updateAddressResponse(ApiResponse<void> value);

  Future<void> updateAddress(
      {required AddressEntity addressEntity, required int index});

  /// -- GET TR PROVINCES --
  ApiResponse<GetProvinceEntity> get getTrProvincesResponse;

  set getTrProvincesResponse(ApiResponse<GetProvinceEntity> value);

  Future<void> getProvinces();

  Future<String?> getCurrentPosition();

  /// init method
  void init(int? index);

  /// deactive method
  void deactivate();

  /// get address city & town
  String getAddressTitle(int index);

  /// get address desc
  String getAddressDesc(int index);

  /// get cities lenght
  int get getCitiesLenght;

  /// get counties lenght
  int get getCountyLenght;

  /// get city name by index
  String getCityByIndex(int index);

  /// get county name by index
  String getCountyByIndex(int index);

  /// get selected city name
  String get getSelectedCityName;

  /// get selected county name
  String get getSelectedCountyName;

  /// is selected city
  bool get isSelectedCity;

  AddressEntity getAddressByIndex(int index);
}
