import 'package:flutter_donate_app/core/usecase/base_usecase.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';
import 'package:flutter_donate_app/domain/repositories/auth_repository.dart';

class ParamsForAuth {
  final String email;
  final String password;

  ParamsForAuth({
    required this.email,
    required this.password,
  });
}

/// -- SIGN UP --
class SignUp extends BaseUseCase<Future<void>, ParamsForAuth> {
  final AuthRepository authRepository;

  SignUp({required this.authRepository});

  @override
  Future<void> execute(ParamsForAuth params) async {
    return await authRepository.signUp(email: params.email, password: params.password);
  }
}

/// -- SIGN IN --
class SignIn extends BaseUseCase<Future<void>, ParamsForAuth> {
  final AuthRepository authRepository;

  SignIn({required this.authRepository});

  @override
  Future<void> execute(ParamsForAuth params) async {
    return await authRepository.signIn(email: params.email, password: params.password);
  }
}

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
  final AuthRepository authRepository;

  SaveUserInfoToFirestore({required this.authRepository});

  @override
  Future<UserEntity> execute(ParamsForSaveUserInfoToFirestore params) async {
    return await authRepository.saveUserInfoToFirestore(
      name: params.name,
      surname: params.surname,
      phoneNumber: params.phoneNumber,
      age: params.age,
      gender: params.gender,
      profileImage: params.profileImage,
    );
  }
}
