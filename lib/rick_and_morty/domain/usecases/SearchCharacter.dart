import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/errors/failure.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_entites.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/repo/base_character_repo.dart';

class Searchcharacter {
  final BaseCharacterRepo baseCharacterRepo;
  Searchcharacter(this.baseCharacterRepo);
  Future<Either<Failure, List<CharacterEntity>>> call(String name) {
    return baseCharacterRepo.searchCharacter(name);
  }
}
