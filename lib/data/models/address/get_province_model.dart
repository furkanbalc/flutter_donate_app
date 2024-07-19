import 'package:flutter_donate_app/domain/entities/address/get_province_entity.dart';

class GetProvinceModel extends GetProvinceEntity {
  @override
  final String status;
  @override
  final List<Datum> data;

  const GetProvinceModel({
    required this.status,
    required this.data,
  }) : super(
          status: status,
          data: data,
        );

  GetProvinceEntity convertToEntity() {
    return GetProvinceEntity(
      status: status,
      data: data,
    );
  }

  factory GetProvinceModel.fromJson(Map<String, dynamic> json) =>
      GetProvinceModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum extends ProvinceEntity {
  final int id;
  final String name;
  final int population;
  final int area;
  final int altitude;
  final List<int> areaCode;
  final bool isMetropolitan;
  final Nuts nuts;
  final Coordinates coordinates;
  final Maps maps;
  final Region region;
  final List<District> districts;

  Datum({
    required this.id,
    required this.name,
    required this.population,
    required this.area,
    required this.altitude,
    required this.areaCode,
    required this.isMetropolitan,
    required this.nuts,
    required this.coordinates,
    required this.maps,
    required this.region,
    required this.districts,
  }) : super(
          city: name,
          lat: coordinates.latitude.toString(),
          long: coordinates.longitude.toString(),
          counties: districts,
        );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        population: json["population"],
        area: json["area"],
        altitude: json["altitude"],
        areaCode: List<int>.from(json["areaCode"].map((x) => x)),
        isMetropolitan: json["isMetropolitan"],
        nuts: Nuts.fromJson(json["nuts"]),
        coordinates: Coordinates.fromJson(json["coordinates"]),
        maps: Maps.fromJson(json["maps"]),
        region: Region.fromJson(json["region"]),
        districts: List<District>.from(
            json["districts"].map((x) => District.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "population": population,
        "area": area,
        "altitude": altitude,
        "areaCode": List<dynamic>.from(areaCode.map((x) => x)),
        "isMetropolitan": isMetropolitan,
        "nuts": nuts.toJson(),
        "coordinates": coordinates.toJson(),
        "maps": maps.toJson(),
        "region": region.toJson(),
        "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
      };
}

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class District extends DistrictEntity {
  final int id;
  final String name;
  final int population;
  final int area;

  const District({
    required this.id,
    required this.name,
    required this.population,
    required this.area,
  }) : super(
          county: name,
        );

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
        population: json["population"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "population": population,
        "area": area,
      };
}

class Maps {
  final String googleMaps;
  final String openStreetMap;

  Maps({
    required this.googleMaps,
    required this.openStreetMap,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMap: json["openStreetMap"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMap": openStreetMap,
      };
}

class Nuts {
  final Nuts1 nuts1;
  final Nuts2 nuts2;
  final String nuts3;

  Nuts({
    required this.nuts1,
    required this.nuts2,
    required this.nuts3,
  });

  factory Nuts.fromJson(Map<String, dynamic> json) => Nuts(
        nuts1: Nuts1.fromJson(json["nuts1"]),
        nuts2: Nuts2.fromJson(json["nuts2"]),
        nuts3: json["nuts3"],
      );

  Map<String, dynamic> toJson() => {
        "nuts1": nuts1.toJson(),
        "nuts2": nuts2.toJson(),
        "nuts3": nuts3,
      };
}

class Nuts1 {
  final String code;
  final Region name;

  Nuts1({
    required this.code,
    required this.name,
  });

  factory Nuts1.fromJson(Map<String, dynamic> json) => Nuts1(
        code: json["code"],
        name: Region.fromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name.toJson(),
      };
}

class Region {
  final String en;
  final String tr;

  Region({
    required this.en,
    required this.tr,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        en: json["en"],
        tr: json["tr"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "tr": tr,
      };
}

class Nuts2 {
  final String code;
  final String name;

  Nuts2({
    required this.code,
    required this.name,
  });

  factory Nuts2.fromJson(Map<String, dynamic> json) => Nuts2(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
      };
}
