class ApiConstance {
  //get Character
  static const String getCharacter =
      "https://rickandmortyapi.com/api/character";

  //Character Details
  static const String baseUrl = "https://rickandmortyapi.com/api";
  static String getCharacterById(int id) => "$baseUrl/character/$id";

  //search
  static String searchCharacter(String name) => "$getCharacter/?name=$name";
}
