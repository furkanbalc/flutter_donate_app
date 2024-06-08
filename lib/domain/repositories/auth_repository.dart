
abstract class AuthRepository {
  /// -- SIGN UP --
  Future<void> signUp({
    required String email,
    required String password,
  });

  /// -- SIGN IN --
  Future<String> signIn({
    required String email,
    required String password,
  });

  ///  -- SIGN OUT --
  Future<void> signOut();

  /// -- DELETE ACCOUNT --
  Future<void> deleteAccount();
}
