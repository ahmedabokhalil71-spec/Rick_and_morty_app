part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

//getcharacter
class GetCharacterEvent extends CharacterEvent {}

// GetCharacterDetailsEvent
class GetCharacterDetailsEvent extends CharacterEvent {
  final int id;

  const GetCharacterDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}
