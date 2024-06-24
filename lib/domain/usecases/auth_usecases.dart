import 'package:flutter_donate_app/core/usecase/base_usecase.dart';
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
    return await authRepository.signUp(
        email: params.email, password: params.password);
  }
}

/// -- SIGN IN --
class SignIn extends BaseUseCase<Future<String>, ParamsForAuth> {
  final AuthRepository authRepository;

  SignIn({required this.authRepository});

  @override
  Future<String> execute(ParamsForAuth params) async {
    return await authRepository.signIn(
        email: params.email, password: params.password);
  }
}

/// -- SIGN OUT USER --
class ParamsBase {
  const ParamsBase();
}

class SignOut extends BaseUseCase<Future<void>, ParamsBase> {
  final AuthRepository authRepository;

  SignOut({required this.authRepository});

  @override
  Future<void> execute(ParamsBase params) async {
    await authRepository.signOut();
  }
}

/// -- DELETE ACCOUNT --
class DeleteAccount extends BaseUseCase<Future<void>, ParamsBase> {
  final AuthRepository authRepository;

  DeleteAccount({required this.authRepository});

  @override
  Future<void> execute(ParamsBase params) async {
    await authRepository.deleteAccount();
  }
}
