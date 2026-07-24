import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/OriginEntity.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final OriginEntity origin;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
  });

  @override
  List<Object?> get props => [id, name, status, species, gender, image, origin];
}
