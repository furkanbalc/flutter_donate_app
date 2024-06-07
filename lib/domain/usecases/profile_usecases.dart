import 'package:flutter_donate_app/core/usecase/base_usecase.dart';
import 'package:flutter_donate_app/domain/entity/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/repositories/profile_repository.dart';

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

/// -- SIGN OUT USER --
class ParamsBase {
  const ParamsBase();
}

class SignOut extends BaseUseCase<Future<void>, ParamsBase> {
  final ProfileRepository profileRepository;

  SignOut({required this.profileRepository});

  @override
  Future<void> execute(ParamsBase params) async {
    await profileRepository.signOut();
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
  final ProfileRepository profileRepository;

  GetAddressInfo({required this.profileRepository});

  @override
  Future<AddressesEntity> execute(ParamsForGetUserInfo params) async {
    return await profileRepository.getAdressesFromFirestore(id: params.id);
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
  final ProfileRepository profileRepository;

  AddAddressToFirestore({required this.profileRepository});

  @override
  Future<AddressesEntity> execute(ParamsForAddAddressToFirestore params) async {
    return await profileRepository.addAddressInfoToFirestore(
      country: params.country,
      city: params.city,
      town: params.town,
      desc: params.desc,
      lat: params.lat,
      long: params.long,
    );
  }
}
