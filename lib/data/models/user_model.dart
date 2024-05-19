import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_donate_app/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  @override
  bool? isActive;
  @override
  bool? isAdmin;
  @override
  Data? data;

  UserModel({
    this.isActive,
    this.isAdmin,
    this.data,
  }) : super(
          isActive: isActive,
          isAdmin: isAdmin,
          data: data,
        );

  Map<String, dynamic> toJson() {
    return {
      'isActive': isActive,
      'isAdmin': isAdmin,
      'data': data,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      isActive: json['isActive'] ?? false,
      isAdmin: json['isAdmin'] ?? false,
      data: json['data'] == null ? null : Data.fromJson(json['data']),
    );
  }

  factory UserModel.fromFirebaseUser(User firebaseUser) {
    return UserModel(
      data: Data(
        id: firebaseUser.uid.toString(),
        email: firebaseUser.email ?? '',
      ),
    );
  }

  UserEntity convertToEntity() {
    return UserEntity(
      isActive: isActive,
      isAdmin: isAdmin,
      data: data,
    );
  }
}

class Data extends DataEntity {
  @override
  String? id;
  FullName? fullName;
  @override
  String? email;
  @override
  String? phoneNumber;
  @override
  String? gender;
  @override
  String? age;
  @override
  String? profileImgUrl;
  @override
  Address? address;
  @override
  List<Statistics>? statistics;

  Data({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.age,
    this.profileImgUrl,
    this.address,
    this.statistics,
  }) : super(
          id: id,
          userName: fullName!.getUserName(),
          email: email,
          phoneNumber: phoneNumber,
          gender: gender,
          age: age,
          profileImgUrl: profileImgUrl,
          address: address,
          statistics: statistics,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'age': age,
      'profileImgUrl': profileImgUrl,
      'address': address,
      'statistics': statistics,
    };
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      fullName: json['fullName'] == null ? null : FullName.fromJson(json['fullName']),
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      age: json['age'],
      profileImgUrl: json['profileImgUrl'],
      address: json['address'] == null ? null : Address.fromJson(json['address']),
      statistics: (json['statistics'])?.map((e) => Statistics.fromJson(e)).toList(),
    );
  }
}

class FullName {
  String? name;
  String? surname;

  FullName({
    this.name,
    this.surname,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
    };
  }

  factory FullName.fromJson(Map<String, dynamic> json) {
    return FullName(
      name: json['name'],
      surname: json['surname'],
    );
  }

  String getUserName() {
    return '$name $surname';
  }
}

class Address extends AddressEntity {
  @override
  String? country;
  @override
  String? city;
  @override
  String? town;
  @override
  Geo? geo;

  Address({
    this.country,
    this.city,
    this.town,
    this.geo,
  }) : super(
          country: country,
          city: city,
          town: town,
          geo: geo,
        );

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'city': city,
      'town': town,
      'geo': geo,
    };
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: json['country'],
      city: json['city'],
      town: json['town'],
      geo: json['geo'] == null ? null : Geo.fromJson(json['geo']),
    );
  }
}

class Geo extends GeoEntity {
  @override
  String? lat;
  @override
  String? lng;

  Geo({
    this.lat,
    this.lng,
  }) : super(
          lat: lat,
          lng: lng,
        );

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Statistics extends StatisticsEntity {
  @override
  String? title;
  @override
  String? count;

  Statistics({
    this.title,
    this.count,
  }) : super(
          title: title,
          count: count,
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'count': count,
    };
  }

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      title: json['title'],
      count: json['count'],
    );
  }
}
