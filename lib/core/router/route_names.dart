enum AppRouteName {
  splash('/', 'Splash'),
  onboard('/onboard', 'Onboard'),
  welcome('/welcome', 'Welcome'),
  signin('/signin', 'Signin'),
  signup('/signup', 'Signup'),
  userInfo('/userInfo', 'UserInfo'),
  genderInfo('/genderInfo', 'GenderInfo'),
  ageInfo('/ageInfo', 'AgeInfo'),
  home('/home', 'Home'),
  product('/product', 'Product'),
  favorites('/favorites', 'Favorites'),
  categories('/categories', 'Categories'),
  profile('/profile', 'Profile'),
  profileInfos('profileInfos', 'ProfileInfos'),
  addressInfos('addressInfos', 'AddressInfos'),
  addAddress('addAddress', 'AddAddress'),
  addressDetail('addressDetail', 'AddressDetail'),
  contactUs('contactUs', 'ContacUs'),
  aboutApp('aboutApp', 'AboutApp'),
  productDetail('productDetail', 'ProductDetail'),
  ;

  const AppRouteName(this.path, this.name);

  final String path;
  final String name;
}
