import 'package:flutter_donate_app/core/usecase/base_usecase.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';
import 'package:flutter_donate_app/domain/repositories/address_repository.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';
import 'package:flutter_donate_app/domain/usecases/profile_usecases.dart';

/// -- GET USER ADDRESS INFO --
class GetAddressInfo extends BaseUseCase<Future<AddressesEntity>, ParamsForGetUserInfo> {
  final AddressRepository addressRepository;

  GetAddressInfo({required this.addressRepository});

  @override
  Future<AddressesEntity> execute(ParamsForGetUserInfo params) async {
    return await addressRepository.getAdressesFromFirestore(id: params.id);
  }
}

/// -- ADD ADDRESS USER INFO --
class ParamsForAddAddressToFirestore {
  final String country;
  final String city;
  final String town;
  final String desc;
  final String lat;
  final String long;

  ParamsForAddAddressToFirestore({
    required this.country,
    required this.city,
    required this.town,
    required this.desc,
    required this.lat,
    required this.long,
  });
}

class AddAddressToFirestore extends BaseUseCase<Future<AddressesEntity>, ParamsForAddAddressToFirestore> {
  final AddressRepository addressRepository;

  AddAddressToFirestore({required this.addressRepository});

  @override
  Future<AddressesEntity> execute(ParamsForAddAddressToFirestore params) async {
    return await addressRepository.addAddressInfoToFirestore(
      country: params.country,
      city: params.city,
      town: params.town,
      desc: params.desc,
      lat: params.lat,
      long: params.long,
    );
  }
}

/// -- REMOVE ADDRES --
class ParamsForRemoveAddress {
  final List<dynamic> list;

  ParamsForRemoveAddress({required this.list});
}

class RemoveAddress extends BaseUseCase<Future<void>, ParamsForRemoveAddress> {
  final AddressRepository addressRepository;

  RemoveAddress({required this.addressRepository});

  @override
  Future<void> execute(ParamsForRemoveAddress params) async {
    await addressRepository.removeAddressesByIndex(params.list);
  }
}

/// -- UPDATE ADDRESS --
class ParamsForUpdateAddress {
  final AddressEntity addressEntity;
  final int index;

  ParamsForUpdateAddress({required this.addressEntity, required this.index});
}

class UpdateAddress extends BaseUseCase<Future<void>, ParamsForUpdateAddress> {
  final AddressRepository addressRepository;

  UpdateAddress({required this.addressRepository});

  @override
  Future<void> execute(ParamsForUpdateAddress params) async {
    await addressRepository.updateAddress(params.addressEntity, params.index);
  }
}

/// -- GET TURKEY PROVINCE --
class GetTrProvinces extends BaseUseCase<Future<GetProvinceEntity>, ParamsBase> {
  final AddressRepository addressRepository;

  GetTrProvinces({required this.addressRepository});

  @override
  Future<GetProvinceEntity> execute(ParamsBase params) async {
    return await addressRepository.getTrProvinces();
  }
}
