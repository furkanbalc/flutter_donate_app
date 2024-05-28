enum AppRouteName {
  splash('/splash','Splash'),
  onboard('/','Onboard'),
  signin('/signin','Signin'),
  signup('/signup','Signup'),
  userInfo('/userInfo','UserInfo'),
  genderInfo('/genderInfo','GenderInfo'),
  ageInfo('/ageInfo','AgeInfo'),
  home('/home','Home'),
  app('/app','App'),
  ;

  const AppRouteName(this.path,this.name);

  final String path;
  final String name;
}