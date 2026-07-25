import 'package:rick_and_morty_app/rick_and_morty/domain/entites/character_details.dart';
import 'package:rick_and_morty_app/rick_and_morty/domain/repo/base_character_repo.dart';

class ExportCharacterExcelUseCase {
  final BaseCharacterRepo repo;

  ExportCharacterExcelUseCase(this.repo);

  Future<void> call(CharacterDetails character) {
    return repo.exportCharacter(character);
  }
}
