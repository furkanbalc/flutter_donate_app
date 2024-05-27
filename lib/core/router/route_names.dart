class RouteNames {
  static const splash = 'splash';
  static const signin = 'signin';
  static const signup = 'signup';
  static const userInfo = 'userInfo';
  static const genderInfo = 'genderInfo';
  static const ageInfo = 'ageInfo';
  static const home = 'home';
}
enum AppRouteName {
  splash('/','Splash'),
  signin('/signin','Signin'),
  signup('/signup','Signup'),
  userInfo('/userInfo','UserInfo'),
  genderInfo('/genderInfo','GenderInfo'),
  ageInfo('/ageInfo','AgeInfo'),
  home('/home','Home'),
  ;

  const AppRouteName(this.path,this.name);

  final String path;
  final String name;
}