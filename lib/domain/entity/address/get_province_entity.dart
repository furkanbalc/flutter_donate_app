import 'package:equatable/equatable.dart';
class GetProvinceEntity extends Equatable {
  final String status;
  final List<ProvinceEntity> data;

  const GetProvinceEntity({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => [
    status,
    data,
  ];
}

class ProvinceEntity extends Equatable {
  final String city;
  final String lat;
  final String long;
  final List<DistrictEntity> counties;

  const ProvinceEntity({
    required this.city,
    required this.lat,
    required this.long,
    required this.counties,
  });

  @override
  List<Object?> get props => [
        city,
        lat,
        long,
        counties,
      ];
}

class DistrictEntity extends Equatable {
  final String county;

  const DistrictEntity({required this.county});

  @override
  List<Object?> get props => [
        county,
      ];
}
