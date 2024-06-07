import 'package:flutter_donate_app/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:flutter_donate_app/data/models/address_model.dart';
import 'package:flutter_donate_app/data/models/user_model.dart';
import 'package:flutter_donate_app/domain/entity/address_entity.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/repositories/profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp({required this.remoteDataSource});

  final RemoteDataSource remoteDataSource;

  ///  -- GET USER INFO --
  @override
  Future<UserEntity> getUserInfoFromFirestore({required String id}) async {
    UserModel userModel = await remoteDataSource.getUserInfoFromFirestore(id: id);
    return userModel.convertToEntity();
  }

  ///  -- SIGN OUT --
  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
  }

  /// -- UPDATE USER INFO --
  @override
  Future<void> updateUserInfo({
    required String id,
    required String name,
    required String surname,
    required String email,
    required String phoneNumber,
    required String gender,
    required String age,
    required dynamic profileImage,
  }) async {
    await remoteDataSource.updateUserInfo(
      id: id,
      name: name,
      surname: surname,
      email: email,
      phoneNumber: phoneNumber,
      gender: gender,
      age: age,
      profileImage: profileImage,
    );
  }

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
}
