part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

final class CharacterInitial extends CharacterState {}

// Get Character
class GetCharacterLoadingState extends CharacterState {}

class GetCharacterSuccessState extends CharacterState {
  final List<CharacterEntity> characters;

  const GetCharacterSuccessState(this.characters);

  @override
  List<Object> get props => [characters];
}

class GetCharacterErrorState extends CharacterState {
  final String message;

  const GetCharacterErrorState(this.message);

  @override
  List<Object> get props => [message];
}

// Get Character details
class GetCharacterDetailsLoadingState extends CharacterState {}

class GetCharacterDetailsSuccessState extends CharacterState {
  final CharacterDetails characterDetails;

  const GetCharacterDetailsSuccessState(this.characterDetails);

  @override
  List<Object> get props => [characterDetails];
}

class GetCharacterDetailsErrorState extends CharacterState {
  final String message;

  const GetCharacterDetailsErrorState(this.message);

  @override
  List<Object> get props => [message];
}
