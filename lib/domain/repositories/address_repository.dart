
import 'package:flutter_donate_app/data/models/address/get_province_model.dart';
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

  /// -- GET TURKEY PROVINCE --
  Future<GetProvinceEntity> getTrProvinces();
}
