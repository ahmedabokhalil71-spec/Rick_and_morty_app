import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/errors/failure.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_details.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/repo/base_character_repo.dart';

class GetCharacterDetails {
  final BaseCharacterRepo baseCharacterRepo;

  GetCharacterDetails(this.baseCharacterRepo);

  Future<Either<Failure, CharacterDetails>> call(int id) {
    return baseCharacterRepo.getCharacterDetails(id);
  }
}
