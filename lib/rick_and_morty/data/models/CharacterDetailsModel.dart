import 'package:rick_and_morty_app/rick_and_morty/data/models/OriginModel.dart';
import 'package:rick_and_morty_app/rick_and_morty/data/models/location.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_details.dart';

class CharacterDetailsModel extends CharacterDetails {
  const CharacterDetailsModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.gender,
    required super.origin,
    required super.image,
    required super.location,
    required super.created,
  });
  factory CharacterDetailsModel.fromJson(Map<String, dynamic> json) {
    return CharacterDetailsModel(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      gender: json["gender"],
      origin: OriginModel.fromJson(json["origin"]),
      image: json["image"],
      location: LocationModel.fromJson(json["location"]),
      created: json["created"],
    );
  }
}
