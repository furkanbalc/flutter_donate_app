import 'package:flutter_donate_app/core/usecase/base_usecase.dart';
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
