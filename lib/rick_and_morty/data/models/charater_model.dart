import 'package:rick_and_morty_app/rick_and_morty/data/models/OriginModel.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_details.dart';
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
  factory CharacterModel.fromDetails(CharacterDetails details) {
    return CharacterModel(
      id: details.id,
      name: details.name,
      status: details.status,
      species: details.species,
      gender: details.gender,
      image: details.image,
      origin: details.origin as OriginModel,
    );
  }

  factory CharacterModel.fromEntity(CharacterEntity entity) {
    return CharacterModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      gender: entity.gender,
      image: entity.image,
      origin: entity.origin as OriginModel,
    );
  }

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
