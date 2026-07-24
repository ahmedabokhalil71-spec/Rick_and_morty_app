import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/OriginEntity.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/location.dart';

class CharacterDetails extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final OriginEntity origin;
  final String image;
  final Location location;
  final String created;
  const CharacterDetails({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.image,
    required this.location,
    required this.created,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    species,
    gender,
    origin,
    image,
    location,
    created,
  ];
}
