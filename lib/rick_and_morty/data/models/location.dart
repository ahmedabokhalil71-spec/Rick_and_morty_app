import 'package:rick_and_morty_app/rick_and_morty/domain/entites/location.dart';

class LocationModel extends Location {
  const LocationModel({required super.name, required super.url});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json["name"] ?? "", url: json["url"] ?? "");
  }
}
