abstract class SplashRepository {
  /// -- IS USER LOGGED IN --
  Future<String?> isUserLoggedIn();

  /// -- GET INITIAL SCREEN AFTER SPLASH --
  Future<bool?> getInitialScreen();

  /// -- SET INITIAL SCREEN AFTER SPLASH --
  Future<void> setInitialScreen();
}
