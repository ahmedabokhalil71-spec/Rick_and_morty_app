import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/errors/failure.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/CharacterFilterEntity.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_entites.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/repo/base_character_repo.dart';

class GetFilteredCharacter {
  final BaseCharacterRepo baseCharacterRepo;

  GetFilteredCharacter(this.baseCharacterRepo);

  Future<Either<Failure, List<CharacterEntity>>> call(
    CharacterFilterEntity filter,
  ) {
    return baseCharacterRepo.getFilteredCharacters(filter);
  }
}
