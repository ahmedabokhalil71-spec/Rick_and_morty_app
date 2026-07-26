import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/rick_and_morty/data/datasource/Character_remote_datasourses.dart';
import 'package:rick_and_morty_app/rick_and_morty/data/repo/Character_repo.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/repo/base_character_repo.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/usecases/SearchCharacter.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/usecases/export_character_excel_usecase.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/usecases/get_character.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/usecases/get_character_details.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/usecases/get_filtered_characters.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/rick_and_morty/presentation/controller/no_internet_bloc/no_internet_bloc.dart';

final sl = GetIt.instance;

Future<void> servicesLocator() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  // Remote Data Source
  sl.registerLazySingleton<BaseCharacterRemoteDatasourses>(
    () => CharacterRemoteDatasourses(),
  );

  // Repository
  sl.registerLazySingleton<BaseCharacterRepo>(
    () => CharacterRepo(baseCharacterRemoteDatasourses: sl()),
  );

  // UseCases

  sl.registerLazySingleton<GetCharacter>(() => GetCharacter(sl()));

  sl.registerLazySingleton<GetCharacterDetails>(
    () => GetCharacterDetails(sl()),
  );

  sl.registerLazySingleton<Searchcharacter>(() => Searchcharacter(sl()));

  sl.registerLazySingleton<GetFilteredCharacter>(
    () => GetFilteredCharacter(sl()),
  );
  //////
  sl.registerLazySingleton<ExportCharacterExcelUseCase>(
    () => ExportCharacterExcelUseCase(sl()),
  );

  // Bloc
  sl.registerFactory<CharacterBloc>(
    () => CharacterBloc(
      sl<GetCharacter>(),
      sl<GetCharacterDetails>(),
      sl<Searchcharacter>(),
      sl<GetFilteredCharacter>(),
      sl<ExportCharacterExcelUseCase>(),
    ),
  );
  // bloc internet
  sl.registerFactory<NoInternetBloc>(() => NoInternetBloc(sl<Connectivity>()));
}
