import 'package:flutter_donate_app/core/usecase/base_usecase.dart';
import 'package:flutter_donate_app/data/models/address/get_province_model.dart';
import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/address/get_province_entity.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/repositories/address_repository.dart';
import 'package:flutter_donate_app/domain/repositories/profile_repository.dart';
import 'package:flutter_donate_app/domain/usecases/auth_usecases.dart';

/// -- SAVE USER INFO --
class ParamsForSaveUserInfoToFirestore {
  final String name;
  final String surname;
  final String phoneNumber;
  final String age;
  final String gender;
  final dynamic profileImage;

  ParamsForSaveUserInfoToFirestore({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.age,
    required this.gender,
    required this.profileImage,
  });
}

class SaveUserInfoToFirestore extends BaseUseCase<Future<UserEntity>, ParamsForSaveUserInfoToFirestore> {
  final ProfileRepository profileRepository;

  SaveUserInfoToFirestore({required this.profileRepository});

  @override
  Future<UserEntity> execute(ParamsForSaveUserInfoToFirestore params) async {
    return await profileRepository.saveUserInfoToFirestore(
      name: params.name,
      surname: params.surname,
      phoneNumber: params.phoneNumber,
      age: params.age,
      gender: params.gender,
      profileImage: params.profileImage,
    );
  }
}

/// -- GET USER INFO --
class ParamsForGetUserInfo {
  final String id;

  ParamsForGetUserInfo({required this.id});
}

class GetUserInfoFromFirestore extends BaseUseCase<Future<UserEntity>, ParamsForGetUserInfo> {
  final ProfileRepository profileRepository;

  GetUserInfoFromFirestore({required this.profileRepository});

  @override
  Future<UserEntity> execute(ParamsForGetUserInfo params) async {
    return await profileRepository.getUserInfoFromFirestore(id: params.id);
  }
}

/// -- UPDATE USER INFO --
class ParamsForUpdateUser {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;
  final String gender;
  final String age;
  final dynamic profileImage;

  ParamsForUpdateUser({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.age,
    required this.profileImage,
  });
}

class UpdateProfileUser extends BaseUseCase<Future<void>, ParamsForUpdateUser> {
  final ProfileRepository profileRepository;

  UpdateProfileUser({required this.profileRepository});

  @override
  Future<void> execute(ParamsForUpdateUser params) async {
    await profileRepository.updateUserInfo(
      id: params.id,
      name: params.name,
      surname: params.surname,
      email: params.email,
      phoneNumber: params.phoneNumber,
      gender: params.gender,
      age: params.age,
      profileImage: params.profileImage,
    );
  }
}

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

/// -- GET TURKEY PROVINCE --
class GetTrProvinces extends BaseUseCase<Future<GetProvinceEntity>, ParamsBase> {
  final AddressRepository addressRepository;

  GetTrProvinces({required this.addressRepository});

  @override
  Future<GetProvinceEntity> execute(ParamsBase params) async {
    return await addressRepository.getTrProvinces();
  }
}
