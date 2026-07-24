class ApiConstance {
  static const String getCharacter =
      "https://rickandmortyapi.com/api/character";
  static const String baseUrl = "https://rickandmortyapi.com/api";

  static String getCharacterById(int id) => "$baseUrl/character/$id";
}
