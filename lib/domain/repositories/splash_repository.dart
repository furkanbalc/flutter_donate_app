abstract class SplashRepository {
  /// -- IS LOGGED IN --
  Future<String?> isUserLoggedIn();

  /// -- GET INITIAL SCREEN AFTER SPLASH --
  Future<bool?> getInitialScreen();

  /// -- SET INITIAL SCREEN AFTER SPLASH --
  Future<void> setInitialScreen();
}
