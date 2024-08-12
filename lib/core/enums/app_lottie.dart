enum AppLotties {
  error('error'),
  ;

  final String value;

  const AppLotties(this.value);

  String get toLottie => 'assets/images/lotties/lottie_$value.json';
}
