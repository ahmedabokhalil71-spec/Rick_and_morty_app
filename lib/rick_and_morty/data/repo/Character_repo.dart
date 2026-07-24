// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/core/errors/excpation.dart';
import 'package:rick_and_morty_app/core/errors/failure.dart';
import 'package:rick_and_morty_app/rick_and_morty/data/datasource/Character_remote_datasourses.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_details.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_entites.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/repo/base_character_repo.dart';

class CharacterRepo extends BaseCharacterRepo {
  final BaseCharacterRemoteDatasourses baseCharacterRemoteDatasourses;

  CharacterRepo({required this.baseCharacterRemoteDatasourses});

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacter() async {
    try {
      final result = await baseCharacterRemoteDatasourses.getCharacter();
      return Right(result);
    } on SereverExcpation catch (failure) {
      return Left(ServerFailure(failure.errorMassegeModel.error));
    }
  }

  @override
  @override
  Future<Either<Failure, CharacterDetails>> getCharacterDetails(int id) async {
    try {
      final result = await baseCharacterRemoteDatasourses.getCharacterDetails(
        id,
      );
      return Right(result);
    } on SereverExcpation catch (failure) {
      return Left(ServerFailure(failure.errorMassegeModel.error));
    }
  }
}
