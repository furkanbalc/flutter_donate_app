import 'package:flutter/material.dart';

/// Uygulama icerisinde siklikla kullanilacak olan ekran boyutlarina
/// extension ile context uzerinden kolay erisim saglandi
extension CustomScreenSizeExtension on BuildContext {
  /// -- screen width
  double dynamicWidth(double? factor) {
    return MediaQuery.of(this).size.width * (factor ?? 1.0);
  }

  /// -- screen height
  double dynamicHeight(double? factor) {
    return MediaQuery.of(this).size.height * (factor ?? 1.0);
  }

  /// -- appbar height
  double getAppBarHeight() {
    return AppBar().preferredSize.height;
  }
}
