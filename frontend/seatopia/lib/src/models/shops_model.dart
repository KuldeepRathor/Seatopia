// To parse this JSON data, do
//
//     final shops = shopsFromJson(jsonString);

import 'dart:convert';

List<Shops> shopsFromJson(String str) =>
    List<Shops>.from(json.decode(str).map((x) => Shops.fromJson(x)));

String shopsToJson(List<Shops> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shops {
  Coordinates coordinates;
  String id;
  String uid;
  String category;
  String address;
  String name;
  String phone;
  String email;
  String password;
  List<String> images;
  String services;
  Map timeslots;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Shops({
    required this.coordinates,
    required this.id,
    required this.uid,
    required this.category,
    required this.address,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.images,
    required this.services,
    required this.timeslots,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Shops.fromJson(Map<String, dynamic> json) => Shops(
        coordinates: Coordinates.fromJson(json["coordinates"]),
        id: json["_id"],
        uid: json["uid"],
        category: json["category"],
        address: json["address"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        images: List<String>.from(json["images"].map((x) => x)),
        services: json["services"],
        timeslots: (json["timeslots"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates.toJson(),
        "_id": id,
        "uid": uid,
        "category": category,
        "address": address,
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "images": List<dynamic>.from(images.map((x) => x)),
        "services": services,
        "timeslots": timeslots,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class Coordinates {
  double longitude;
  double latitude;

  Coordinates({
    required this.longitude,
    required this.latitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
      };
}
