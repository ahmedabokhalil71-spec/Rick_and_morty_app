import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/errors/failure.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/CharacterFilterEntity.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_details.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_entites.dart';

abstract class BaseCharacterRepo {
  Future<Either<Failure, List<CharacterEntity>>> getCharacter();
  Future<Either<Failure, CharacterDetails>> getCharacterDetails(int id);
  Future<Either<Failure, List<CharacterEntity>>> searchCharacter(String name);
  Future<Either<Failure, List<CharacterEntity>>> getFilteredCharacters(
    CharacterFilterEntity filter,
  );
  Future<void> exportCharacter(CharacterDetails character);
}
