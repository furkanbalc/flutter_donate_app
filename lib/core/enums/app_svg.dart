/// -- SVG --
enum AppSvg {
  apple('apple'),
  google('google'),
  facebook('facebook'),
  profile('profile'),
  profileOutlined('profile-outlined'),
  location('location'),
  locationOutlined('location-outlined'),
  settings('settings'),
  logout('logout'),
  info('info'),
  statistic('statistic'),
  man('man'),
  woman('woman'),
  ;

  final String value;

  const AppSvg(this.value);

  String get toSvg => 'assets/images/svg/$value.svg';
}
