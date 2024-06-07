import 'package:equatable/equatable.dart';

class AddressesEntity extends Equatable {
  final List<AddressEntity>? address;

  AddressesEntity({required this.address});

  @override
  List<Object?> get props => [address];
}

class AddressEntity extends Equatable {
  final String? country;
  final String? city;
  final String? town;
  final String? desc;
  final GeoEntity? geo;

  const AddressEntity({
    required this.country,
    required this.city,
    required this.town,
    required this.desc,
    required this.geo,
  });

  @override
  List<Object?> get props => [
        country,
        city,
        town,
        desc,
        geo,
      ];
}

class GeoEntity extends Equatable {
  final String? lat;
  final String? lng;

  const GeoEntity({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}
