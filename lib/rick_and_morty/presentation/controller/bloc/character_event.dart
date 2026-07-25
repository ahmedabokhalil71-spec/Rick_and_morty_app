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

// SearchCharacter
class SearchCharacterByNameEvent extends CharacterEvent {
  final String name;

  const SearchCharacterByNameEvent(this.name);

  @override
  List<Object> get props => [name];
}

// filter
class FilterCharactersEvent extends CharacterEvent {
  final CharacterFilterEntity filter;

  const FilterCharactersEvent(this.filter);
}

///////
class ExportCharacterEvent extends CharacterEvent {
  final CharacterDetails character;

  ExportCharacterEvent(this.character);
}
