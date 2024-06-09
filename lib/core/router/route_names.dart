enum AppRouteName {
  splash('/splash','Splash'),
  onboard('/onboard','Onboard'),
  signin('/','Signin'),
  signup('/signup','Signup'),
  userInfo('/userInfo','UserInfo'),
  genderInfo('/genderInfo','GenderInfo'),
  ageInfo('/ageInfo','AgeInfo'),
  home('/home','Home'),
  profile('/profile','Profile'),
  profileInfos('profileInfos','ProfileInfos'),
  app('/app','App'),
  ;

  const AppRouteName(this.path,this.name);

  final String path;
  final String name;
}