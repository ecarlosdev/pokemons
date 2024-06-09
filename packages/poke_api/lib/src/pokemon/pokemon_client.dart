import 'package:http/http.dart' as http;
import 'package:poke_api/src/pokemon/pokemon.dart';
import 'package:poke_api/src/shared/shared.dart';

class PokemonClient extends PokeApiV2Baseclient<Pokemon> {
  PokemonClient({
    http.Client? client,
  }) : super(client: client);

  @override
  Pokemon mapResource(Map<String, dynamic> json) {
    return Pokemon.fromJson(json);
  }

  @override
  String get resourcePath => 'pokemon';
}
