import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/data/models/address/get_province_model.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/domain/usecases/profile_usecases.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/address_viewmodel.dart';

class AddressViewModelImp extends ChangeNotifier implements AddressViewModel {
  /// VARIABLES
  bool _isDeleteMode = false;
  bool _isAllSelected = false;
  late List<bool> _isCheckedList;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _country = TextEditingController(text: 'Türkiye');
  final TextEditingController _city = TextEditingController();
  final TextEditingController _county = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  final TextEditingController _search = TextEditingController();
  int _selectedCityIndex = -1;
  int _selectedCountyIndex = -1;

  /// GETTERS
  @override
  bool get isDeleteMode => _isDeleteMode;

  @override
  bool get isAllSelected => _isAllSelected;

  @override
  List<bool> get isCheckedList => _isCheckedList;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  TextEditingController get country => _country;

  @override
  TextEditingController get city => _city;

  @override
  TextEditingController get county => _county;

  @override
  TextEditingController get desc => _desc;

  @override
  TextEditingController get search => _search;

  @override
  int get selectedCityIndex => _selectedCityIndex;

  @override
  int get selectedCountyIndex => _selectedCountyIndex;

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

  @override
  set selectedCityIndex(int value) {
    _selectedCityIndex = value;
    notifyListeners();
  }

  @override
  set selectedCountyIndex(int value) {
    _selectedCountyIndex = value;
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

  /// -- GET TURKEY PROVINCE --
  ApiResponse<GetProvinceEntity> _getTrProvincesResponse = ApiResponse.loading('loading');

  @override
  ApiResponse<GetProvinceEntity> get getTrProvincesResponse => _getTrProvincesResponse;

  @override
  set getTrProvincesResponse(ApiResponse<GetProvinceEntity> value) {
    _getTrProvincesResponse = value;
    notifyListeners();
  }

  @override
  Future<void> getProvinces() async {
    try {
      final GetProvinceEntity getProvinceEntity = await injector<GetTrProvinces>().execute(
        const ParamsBase(),
      );
      getTrProvincesResponse = ApiResponse.completed(getProvinceEntity);
    } catch (e, stackTrace) {
      getTrProvincesResponse = ApiResponse.error(e, stackTrace);
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
      '${getAddressFromFirestoreResponse.data.address?[index].county}/${getAddressFromFirestoreResponse.data.address?[index].city}';

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

  /// get cities lenght
  @override
  int get getCitiesLenght => getTrProvincesResponse.data.data.length;

  /// get counties lenght
  @override
  int get getCountyLenght => getTrProvincesResponse.data.data[selectedCityIndex].counties.length;

  /// get city object by index
  @override
  String getCityByIndex(int index) => getTrProvincesResponse.data.data[index].city;

  /// get county name by index
  @override
  String getCountyNameByIndex(int index) {
    return getTrProvincesResponse.data.data[selectedCityIndex].counties[index].county;
  }

  /// get selected city name
  @override
  String get getSelectedCityName => getTrProvincesResponse.data.data[selectedCityIndex].city;

  /// get selected county name
  @override
  String get getSelectedCountyName =>
      county.text = getTrProvincesResponse.data.data[selectedCityIndex].counties[selectedCountyIndex].county;

  /// is selected city
  @override
  bool get isSelectedCity => selectedCityIndex != -1;
}
