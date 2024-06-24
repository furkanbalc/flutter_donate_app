/// Uygulamada kullanilan size degerlerini tutar tekrar tekrar elle yazmak yerine enum tercih edildi
enum AppSizes {
  /// Size: 4.0
  low1(4.0),

  /// Size: 8.0
  low2(8.0),

  /// Size: 12.0
  low3(12.0),

  /// Size: 16.0
  medium1(16.0),

  /// Size: 20.0
  medium2(20.0),

  /// Size: 24.0
  medium3(24.0),

  /// Size: 28.0
  high1(28.0),

  /// Size: 32.0
  high2(32.0),

  /// Size: 36.0
  high3(36.0),

  /// Size: 40.0
  ultra1(40.0),

  /// Size: 44.0
  ultra2(44.0),

  /// Size: 48.0
  ultra3(48.0),
  ;

  final double value;
  const AppSizes(this.value);
}
