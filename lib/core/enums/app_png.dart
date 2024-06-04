/// -- PNG --
enum AppPng {
  appLogo('app-logo'),
  linesBg('lines-bg'),
  ellipsis('ellipsis'),
  sofa('sofa'),
  emptyNotification('empty-notification'),
  phone('phone'),
  img1('img1'),
  img2('img2'),
  img3('img3'),
  img4('img4'),
  trFlag('tr-flag'),
  ;

  final String value;

  const AppPng(this.value);

  String get toPng => 'assets/images/png/$value.png';
}
