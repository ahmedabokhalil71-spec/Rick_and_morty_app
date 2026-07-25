import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_details.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_entites.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/usecases/SearchCharacter.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/usecases/get_character.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/usecases/get_character_details.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacter getCharacter;
  final GetCharacterDetails getCharacterDetails;
  final Searchcharacter searchcharacter;

  CharacterBloc(
    this.getCharacter,
    this.getCharacterDetails,
    this.searchcharacter,
  ) : super(CharacterInitial()) {
    on<GetCharacterEvent>(_getCharacter);
    on<GetCharacterDetailsEvent>(_getCharacterDetails);
    on<SearchCharacterByNameEvent>(_searchCharacter);
  }

  Future<void> _getCharacter(
    CharacterEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(GetCharacterLoadingState());

    final result = await getCharacter();

    result.fold(
      (failure) {
        emit(GetCharacterErrorState(failure.message));
      },
      (character) {
        emit(GetCharacterSuccessState(character));
      },
    );
  }

  Future<void> _getCharacterDetails(
    GetCharacterDetailsEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(GetCharacterDetailsLoadingState());

    final result = await getCharacterDetails(event.id);

    result.fold(
      (failure) {
        emit(GetCharacterDetailsErrorState(failure.message));
      },
      (character) {
        emit(GetCharacterDetailsSuccessState(character));
      },
    );
  }

  Future<void> _searchCharacter(
    SearchCharacterByNameEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(SearchCharacterLoading());

    final result = await searchcharacter(event.name);

    result.fold(
      (failure) => emit(SearchCharacterError(failure.message)),
      (characters) => emit(SearchCharacterSuccess(characters)),
    );
  }
}
