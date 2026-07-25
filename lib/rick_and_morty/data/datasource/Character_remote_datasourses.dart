// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/errors/excpation.dart';
import 'package:rick_and_morty_app/core/netWork/api_constance.dart';
import 'package:rick_and_morty_app/core/netWork/error_massege_model.dart';
import 'package:rick_and_morty_app/rick_and_morty/data/models/CharacterDetailsModel.dart';
import 'package:rick_and_morty_app/rick_and_morty/data/models/charater_model.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/CharacterFilterEntity.dart';

abstract class BaseCharacterRemoteDatasourses {
  Future<List<CharacterModel>> getCharacter();
  Future<CharacterDetailsModel> getCharacterDetails(int id);
  Future<List<CharacterModel>> searchCharacter(String name);
  Future<List<CharacterModel>> getFilteredCharacters(
    CharacterFilterEntity filter,
  );
}

class CharacterRemoteDatasourses extends BaseCharacterRemoteDatasourses {
  @override
  Future<List<CharacterModel>> getCharacter() async {
    try {
      final response = await Dio().get(ApiConstance.getCharacter);

      if (response.statusCode == 200) {
        return List<CharacterModel>.from(
          (response.data["results"] as List).map(
            (e) => CharacterModel.fromJson(e),
          ),
        );
      } else {
        throw SereverExcpation(
          errorMassegeModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioException catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<CharacterDetailsModel> getCharacterDetails(int id) async {
    final response = await Dio().get(ApiConstance.getCharacterById(id));

    if (response.statusCode == 200) {
      return CharacterDetailsModel.fromJson(response.data);
    } else {
      throw SereverExcpation(
        errorMassegeModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CharacterModel>> searchCharacter(String name) async {
    try {
      final response = await Dio().get(ApiConstance.searchCharacter(name));

      return List<CharacterModel>.from(
        (response.data["results"] as List).map(
          (e) => CharacterModel.fromJson(e),
        ),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }

      throw SereverExcpation(
        errorMassegeModel: ErrorMessageModel.fromJson(e.response?.data),
      );
    }
  }

  @override
  Future<List<CharacterModel>> getFilteredCharacters(
    CharacterFilterEntity filter,
  ) async {
    final response = await Dio().get(
      ApiConstance.filterCharacter(
        status: filter.status,
        gender: filter.gender,
        species: filter.species,
      ),
    );

    if (response.statusCode == 200) {
      return List<CharacterModel>.from(
        (response.data["results"] as List).map(
          (e) => CharacterModel.fromJson(e),
        ),
      );
    } else {
      throw SereverExcpation(
        errorMassegeModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
