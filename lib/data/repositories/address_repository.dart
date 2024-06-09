import 'package:flutter_donate_app/core/service/location_service.dart';
import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/address/address_model.dart';
import 'package:flutter_donate_app/data/models/address/current_location_model.dart';
import 'package:flutter_donate_app/data/models/address/get_province_model.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';
import 'package:flutter_donate_app/domain/repositories/address_repository.dart';
import 'package:geocoding/geocoding.dart';

class AddressRepositoryImp implements AddressRepository {
  AddressRepositoryImp({
    required this.remoteDataSource,
    required this.locationService,
  });

  final RemoteDataSource remoteDataSource;
  final LocationService locationService;

  /// -- GET USER ADDRESS INFO --
  @override
  Future<AddressesEntity> getAdressesFromFirestore({required String id}) async {
    AddressesModel addressesModel = await remoteDataSource.getAdressesFromFirestore(id: id);
    return addressesModel.convertToEntity();
  }

  /// -- ADD ADDRESS INFO --
  @override
  Future<AddressesEntity> addAddressInfoToFirestore({
    required String country,
    required String city,
    required String town,
    required String desc,
    required String lat,
    required String long,
  }) async {
    AddressesModel addressModel = await remoteDataSource.addAddressInfoToFirestore(
      country: country,
      city: city,
      town: town,
      desc: desc,
      lat: lat,
      long: long,
    );
    return addressModel.convertToEntity();
  }

  /// -- GET TURKEY PROVINCE --
  @override
  Future<GetProvinceEntity> getTrProvinces() async {
    GetProvinceModel provinceModel = await remoteDataSource.getTrProvinces();
    return provinceModel.convertToEntity();
  }

  Future<CurrentLocationModel> getCurrentLocation() async {
    final position = await locationService.getCurrentPosition();
    final placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    final place = placemarks[0];

    return CurrentLocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      address: '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}',
      city: place.administrativeArea ?? '',
      county: place.locality ?? '',
    );
  }
}
