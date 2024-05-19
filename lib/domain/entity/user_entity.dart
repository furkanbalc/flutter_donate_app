import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final bool? isActive;
  final bool? isAdmin;
  final DataEntity? data;

  const UserEntity({
    required this.isActive,
    required this.isAdmin,
    required this.data,
  });

  @override
  List<Object?> get props => [
        isActive,
        isAdmin,
        data,
      ];
}

class DataEntity extends Equatable {
  final String? id;
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? gender;
  final String? age;
  final String? profileImgUrl;
  final AddressEntity? address;
  final List<StatisticsEntity>? statistics;

  const DataEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.age,
    required this.profileImgUrl,
    required this.address,
    required this.statistics,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        email,
        phoneNumber,
        gender,
        age,
        profileImgUrl,
        address,
        statistics,
      ];
}

class AddressEntity extends Equatable {
  final String? country;
  final String? city;
  final String? town;
  final GeoEntity? geo;

  const AddressEntity({
    required this.country,
    required this.city,
    required this.town,
    required this.geo,
  });

  @override
  List<Object?> get props => [
        country,
        city,
        town,
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

class StatisticsEntity extends Equatable {
  final String? title;
  final String? count;

  const StatisticsEntity({
    required this.title,
    required this.count,
  });

  @override
  List<Object?> get props => [
        title,
        title,
      ];
}
