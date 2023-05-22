import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/pokemon_model.dart';

class PokemonApiService {
  final String _url = 'https://pokeapi.co/api/v2/pokemon/';
  final limit = 20;
  Future<List<String>> getPokemonUrls(int start) async {
    final response =
        await http.get(Uri.parse(_url + '?offset=$start&$limit=20'));
    if (response.statusCode == 200) {
      return json
          .decode(response.body)['results']
          .map<String>((json) => json['url'] as String)
          .toList();
    } else {
      throw Exception('Failed to load pokemon');
    }
  }

  Future<Pokemon> getPokemonDetails(String pokemonUrlDetail) async {
    final response = await http.get(Uri.parse(pokemonUrlDetail));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load pokemon');
    }
  }
}
