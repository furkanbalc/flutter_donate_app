/// Uygulamada kullanilan size degerlerini tutar tekrar tekrar elle yazmak yerine enum tercih edildi
enum AppSizes {
  min(4.0),
  low(8.0),
  normal(12.0),
  medium(16.0),
  high(20.0),
  ultra(24.0),
  custom(36),
  profilePageIconSize(28),
  ;

  final double value;
  const AppSizes(this.value);
}
