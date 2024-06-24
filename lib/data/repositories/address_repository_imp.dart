import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/address/address_model.dart';
import 'package:flutter_donate_app/data/models/address/get_province_model.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';
import 'package:flutter_donate_app/domain/repositories/address_repository.dart';

class AddressRepositoryImp implements AddressRepository {
  AddressRepositoryImp({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  /// -- GET USER ADDRESS INFO --
  @override
  Future<AddressesEntity> getAdressesFromFirestore({required String id}) async {
    AddressesModel addressesModel =
        await remoteDataSource.getAdressesFromFirestore(id: id);
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
    AddressesModel addressModel =
        await remoteDataSource.addAddressInfoToFirestore(
      country: country,
      city: city,
      town: town,
      desc: desc,
      lat: lat,
      long: long,
    );
    return addressModel.convertToEntity();
  }

  /// -- REMOVE ADDRES --
  @override
  Future<void> removeAddressesByIndex(List<dynamic> addresses) async {
    await remoteDataSource.removeAddressesByIndex(addresses);
  }

  /// -- GET TURKEY PROVINCES --
  @override
  Future<GetProvinceEntity> getTrProvinces() async {
    GetProvinceModel provinceModel = await remoteDataSource.getTrProvinces();
    return provinceModel.convertToEntity();
  }

  /// -- UPDATE ADDRESS --
  @override
  Future<void> updateAddress(AddressEntity addressEntity, int index) async {
    await remoteDataSource.updateAddressAtIndex(addressEntity, index);
  }
}
