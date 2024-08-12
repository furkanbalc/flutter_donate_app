import 'package:flutter_donate_app/data/models/permission_model.dart';
import 'package:geolocator/geolocator.dart';

class PermissionService {
  Future<PermissionModel> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return PermissionModel(status: false, message: 'Konum servisi kapalı. Lütfen aktif edin.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return PermissionModel(status: false, message: 'Konum erişim izni reddedildi.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return PermissionModel(status: false, message: 'Konum izinleri kalıcı olarak reddedildi, erişim yok.');
    }
    return PermissionModel(status: true);
  }
}
