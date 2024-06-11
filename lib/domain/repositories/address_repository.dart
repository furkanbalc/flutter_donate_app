import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';

abstract class AddressRepository {
  /// -- GET USER ADDRESS INFO --
  Future<AddressesEntity> getAdressesFromFirestore({required String id});

  /// -- ADD ADDRESS INFO --
  Future<AddressesEntity> addAddressInfoToFirestore({
    required String country,
    required String city,
    required String town,
    required String desc,
    required String lat,
    required String long,
  });

  /// -- REMOVE ADDRES --
  Future<void> removeAddressesByIndex(List<dynamic> addresses);

  /// -- GET TURKEY PROVINCES --
  Future<GetProvinceEntity> getTrProvinces();
}
