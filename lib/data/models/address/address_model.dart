import 'package:flutter_donate_app/domain/entity/address/address_entity.dart';

class AddressesModel extends AddressesEntity {
  List<Address>? addresses;

  AddressesModel({
    this.addresses,
  }) : super(
          address: addresses,
        );

  Map<String, dynamic> toJson() {
    return {
      'addresses': addresses?.map((address) => address.toJson()).toList(),
    };
  }

  factory AddressesModel.fromJson(Map<String, dynamic>? json) {
    return AddressesModel(
      addresses: json?['addresses'] != null
          ? List<Address>.from(
              json!['addresses'].map((e) => Address.fromJson(e)))
          : null,
    );
  }

  AddressesEntity convertToEntity() {
    return AddressesEntity(
      address: addresses,
    );
  }
}

class Address extends AddressEntity {
  @override
  String? country;
  @override
  String? city;
  @override
  String? county;
  @override
  String? desc;
  @override
  Geo? geo;

  Address({
    this.country,
    this.city,
    this.county,
    this.desc,
    this.geo,
  }) : super(
          country: country,
          city: city,
          county: county,
          desc: desc,
          geo: geo,
        );

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'city': city,
      'county': county,
      'desc': desc,
      'geo': geo?.toJson(),
    };
  }

  factory Address.fromJson(Map<String, dynamic>? json) {
    return Address(
      country: json?['country'],
      city: json?['city'],
      county: json?['county'],
      desc: json?['desc'],
      geo: json?['geo'] != null ? Geo.fromJson(json!['geo']) : null,
    );
  }
}

class Maps {
  String? googleMaps;
  String? openStreetMap;

  Maps({
    this.googleMaps,
    this.openStreetMap,
  });

  Maps copyWith({
    String? googleMaps,
    String? openStreetMap,
  }) {
    return Maps(
      googleMaps: googleMaps ?? this.googleMaps,
      openStreetMap: openStreetMap ?? this.openStreetMap,
    );
  }

  factory Maps.fromJson(Map<String, dynamic> json) {
    return Maps(
      googleMaps: json['googleMaps'] as String?,
      openStreetMap: json['openStreetMap'] as String?,
    );
  }
}

class Geo extends GeoEntity {
  @override
  String? lat;
  @override
  String? long;

  Geo({
    this.lat,
    this.long,
  }) : super(
          lat: lat,
          long: long,
        );

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory Geo.fromJson(Map<String, dynamic>? json) {
    return Geo(
      lat: json?['lat'],
      long: json?['long'],
    );
  }
}
