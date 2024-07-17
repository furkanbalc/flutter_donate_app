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
  instagram('instagram'),
  whatsapp('whatsapp'),
  linkedin('linkedin'),
  github('github'),
  phone('phone'),
  education('education'),
  health('health'),
  pet('pet'),
  sofa('sofa'),
  sport('sport'),
  tools('tools'),
  clothes('clothes'),
  technology('technology'),
  verificationEmail('verification-email'),
  verificatedEmail('verificated-email'),
  ;

  final String value;

  const AppSvg(this.value);

  String get toSvg => 'assets/images/svg/$value.svg';
}
