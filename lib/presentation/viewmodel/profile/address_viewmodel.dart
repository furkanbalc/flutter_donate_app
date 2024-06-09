import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/data/models/address/get_province_model.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';

abstract class AddressViewModel extends ChangeNotifier {
  /// VARIABLES
  bool get isDeleteMode;

  bool get isAllSelected;

  List<bool> get isCheckedList;

  set isDeleteMode(bool value);

  set isCheckedList(List<bool> value);

  set isAllSelected(bool value);

  GlobalKey<FormState> get formKey;

  TextEditingController get country;

  TextEditingController get city;

  TextEditingController get county;

  TextEditingController get desc;

  TextEditingController get search;

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

  Future<void> addAdressesToFirestore({
    required String country,
    required String city,
    required String town,
    required String desc,
    required String lat,
    required String long,
  });

  /// -- GET TURKEY PROVINCE --
  ApiResponse<GetProvinceEntity> get getTrProvincesResponse;

  set getTrProvincesResponse(ApiResponse<GetProvinceEntity> value);

  Future<void> getProvinces();

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

  /// get cities lenght
  int get getCitiesLenght;

  /// get counties lenght
  int get getCountyLenght;

  /// get city name by index
  String getCityByIndex(int index);

  /// get county name by index
  String getCountyNameByIndex(int index);

  /// get selected city name
  String get getSelectedCityName;

  /// get selected county name
  String get getSelectedCountyName;

  /// is selected city
  bool get isSelectedCity;
}
