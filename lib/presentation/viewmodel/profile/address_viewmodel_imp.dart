import 'package:flutter/material.dart';
import 'package:flutter_donate_app/core/api_helper/api_response.dart';
import 'package:flutter_donate_app/core/service/permission_service.dart';
import 'package:flutter_donate_app/data/models/permission_model.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';
import 'package:flutter_donate_app/domain/usecases/address_usecase.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/domain/usecases/profile_usecases.dart';
import 'package:flutter_donate_app/injection.dart';
import 'package:flutter_donate_app/presentation/viewmodel/profile/address_viewmodel.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

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
  String? _currentAddress;
  Position? _currentPosition;
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
  Position? get currentPosition => _currentPosition;

  @override
  String? get currentAddress => _currentAddress;

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

  set currentPosition(Position? value) {
    _currentPosition = value;
    notifyListeners();
  }

  set currentAddress(String? value) {
    _currentAddress = value;
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

  ///

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

  ///

  @override
  Future<void> addAdressesToFirestore() async {
    addAddressToFirestoreResponse = ApiResponse.loading("loading");
    try {
      final AddressesEntity addressesEntity = await injector<AddAddressToFirestore>().execute(
        ParamsForAddAddressToFirestore(
          country: _country.text,
          city: _city.text,
          town: _county.text,
          desc: _desc.text,
          lat: _currentPosition?.latitude.toString() ?? '',
          long: _currentPosition?.longitude.toString() ?? '',
        ),
      );
      addAddressToFirestoreResponse = ApiResponse.completed(addressesEntity);
    } catch (e, stackTrace) {
      addAddressToFirestoreResponse = ApiResponse.error(e, stackTrace);
    }
  }

  /// -- DELETE ADDRESS --
  ApiResponse<void> _deleteAddressResponse = ApiResponse.initial('initial');

  @override
  ApiResponse<void> get deleteAddressResponse => _deleteAddressResponse;

  @override
  set deleteAddressResponse(ApiResponse<void> value) {
    _deleteAddressResponse = value;
    notifyListeners();
  }

  ///

  @override
  Future<void> deleteAddress({required List<int> deleteAddressIndices}) async {
    deleteAddressResponse = ApiResponse.loading('loading');
    try {
      await injector<RemoveAddress>().execute(
        ParamsForRemoveAddress(list: deleteAddressIndices),
      );
      deleteAddressResponse = ApiResponse.completed('completed');
    } catch (e, stackTrace) {
      deleteAddressResponse = ApiResponse.error(e, stackTrace);
    }
  }

  /// -- GET TURKEY CITY AND DISTRICT API --
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

  ///
  @override
  Future<String?> getCurrentPosition() async {
    PermissionModel permissionModel = await PermissionService().handleLocationPermission();
    if (permissionModel.status) {
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
        currentPosition = position;
        _getAddressFromLatLng(currentPosition!);
      }).catchError((e) {
        debugPrint(e);
      });
    } else {
      return permissionModel.message;
    }
    return null;
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark placemark = placemarks[0];
      desc.text =
          '${placemark.street}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.postalCode}, ${placemark.country}, ${placemark.isoCountryCode}';
      city.text = placemark.administrativeArea ?? '';
      county.text = placemark.subAdministrativeArea ?? '';
    }).catchError((e) {
      debugPrint(e);
    });
  }

  /// init method
  @override
  void init() {
    _isCheckedList = List<bool>.filled(getAddressFromFirestoreResponse.data.address?.length ?? 0, false);
  }

  /// deactive method
  @override
  void deactivate() {
    city.clear();
    county.clear();
    desc.clear();
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
