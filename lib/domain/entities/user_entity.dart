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
  final List<StatisticsEntity>? statistics;

  const DataEntity({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.age,
    required this.profileImgUrl,
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
        statistics,
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
