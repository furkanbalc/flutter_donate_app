import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/domain/entity/address_entity.dart';
import 'package:flutter_donate_app/domain/usecases/profile_usecases.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/address_viewmodel.dart';

class AddressViewModelImp extends ChangeNotifier implements AddressViewModel {
  /// VARIABLES
  bool _isDeleteMode = false;
  bool _isAllSelected = false;
  late List<bool> _isCheckedList;

  /// GETTERS
  @override
  bool get isDeleteMode => _isDeleteMode;

  @override
  bool get isAllSelected => _isAllSelected;

  @override
  List<bool> get isCheckedList => _isCheckedList;

  /// SETTERS
  @override
  set isDeleteMode(bool value) {
    _isDeleteMode = value;
    notifyListeners();
  }

  @override
  set isAllSelected(bool value) {
    _isAllSelected = value;
    notifyListeners();
  }

  @override
  set isCheckedList(List<bool> value) {
    _isCheckedList = value;
    notifyListeners();
  }

  /// METHODS
  ///
  ///  -- GET ADDRESS INFO --
  ApiResponse<AddressesEntity> _getAddressFromFirestoreResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<AddressesEntity> get getAddressFromFirestoreResponse => _getAddressFromFirestoreResponse;

  @override
  set getAddressFromFirestoreResponse(ApiResponse<AddressesEntity> value) {
    _getAddressFromFirestoreResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getAdressesFromFirestore({required String id}) async {
    getAddressFromFirestoreResponse = ApiResponse.loading("loading");
    try {
      final AddressesEntity addressesEntity = await injector<GetAddressInfo>().execute(
        ParamsForGetUserInfo(id: id),
      );
      getAddressFromFirestoreResponse = ApiResponse.completed(addressesEntity);
    } catch (e, stackTrace) {
      getAddressFromFirestoreResponse = ApiResponse.error(e, stackTrace);
    }
  }

  ///  -- ADD ADDRESS INFO --
  ApiResponse<AddressesEntity> _addAddressToFirestoreResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<AddressesEntity> get addAddressToFirestoreResponse => _addAddressToFirestoreResponse;

  @override
  set addAddressToFirestoreResponse(ApiResponse<AddressesEntity> value) {
    _addAddressToFirestoreResponse = value;
    notifyListeners();
  }

  @override
  Future<void> addAdressesToFirestore({
    required String country,
    required String city,
    required String town,
    required String desc,
    required String lat,
    required String long,
  }) async {
    addAddressToFirestoreResponse = ApiResponse.loading("loading");
    try {
      final AddressesEntity addressesEntity = await injector<AddAddressToFirestore>().execute(
        ParamsForAddAddressToFirestore(
          country: country,
          city: city,
          town: town,
          desc: desc,
          lat: lat,
          long: long,
        ),
      );
      addAddressToFirestoreResponse = ApiResponse.completed(addressesEntity);
    } catch (e, stackTrace) {
      addAddressToFirestoreResponse = ApiResponse.error(e, stackTrace);
    }
  }

  /// init method
  @override
  void init() {
    _isCheckedList = List<bool>.filled(getAddressFromFirestoreResponse.data.address?.length ?? 0, false);
  }

  /// get address city & town
  @override
  String getAddressDesc(int index) => getAddressFromFirestoreResponse.data.address?[index].desc ?? '';

  /// get address desc
  @override
  String getAddressTitle(int index) =>
      '${getAddressFromFirestoreResponse.data.address?[index].town}/${getAddressFromFirestoreResponse.data.address?[index].city}';

  /// select all addresses
  @override
  void selectAllAddress() {
    isAllSelected = !isAllSelected;
    isCheckedList = List<bool>.filled(isCheckedList.length, isAllSelected);
  }

  /// address delete mode on
  @override
  void deleteModeOn() {
    isDeleteMode = true;
  }

  /// address delete mode off
  @override
  void deleteModeOff() {
    isDeleteMode = false;
    isAllSelected = false;
    isCheckedList = List<bool>.filled(isCheckedList.length, false);
  }
}
