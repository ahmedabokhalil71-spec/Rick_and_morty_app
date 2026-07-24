import 'package:rick_and_morty_app/rick_and_morty/data/models/OriginModel.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_entites.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.gender,
    required super.image,
    required super.origin,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      gender: json["gender"],
      image: json["image"],
      origin: OriginModel.fromJson(json["origin"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "status": status,
      "species": species,
      "gender": gender,
      "image": image,
      "origin": (origin as OriginModel).toJson(),
    };
  }
}
