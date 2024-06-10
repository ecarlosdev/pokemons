import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:poke_api/poke_api.dart' as poke_api;
import 'package:repositories/src/pokemon/pokemon.dart';
import 'package:repositories/src/pokemon/utils/pokemon_names.dart';

/// Repository of Pokemon.
class PokemonRepository {
  /// Constructor of PokemonRepository.
  PokemonRepository(
    poke_api.PokeApi pokeApi,
  ) : _pokeApi = pokeApi;

  final poke_api.PokeApi _pokeApi;

  /// Get a paginated list of Pokemon.
  Future<PaginatedList<Pokemon>> list({
    int offset = 0,
    int limit = 20,
  }) async {
    final response = await _pokeApi.pokemon.list(
      offset: offset,
      limit: limit,
    );
    return PaginatedList<Pokemon>(
      results: response.results.map(Pokemon.fromApiModel).toList(),
      nextLimit: response.nextLimit,
      nextOffset: response.nextOffset,
      total: response.count,
    );
  }

  /// Get a Pokemon by its id.
  Future<Pokemon?> byId(int id) async {
    final response = await _pokeApi.pokemon.byId(id);
    if (response == null) {
      return null;
    }
    return Pokemon.fromApiModel(response);
  }

  /// Get a Pokemon by its name.
  Future<Pokemon?> byName(String name) async {
    final response = await _pokeApi.pokemon.byName(name);
    if (response == null) {
      return null;
    }
    return Pokemon.fromApiModel(response);
  }

  Future<List<Pokemon>> search(String search) async {
    final similarNames = extractTop(
      query: search,
      choices: pokemonNames,
      limit: 20,
      cutoff: 60,
    ).map((e) => e.choice).toList();
    final response = await _pokeApi.pokemon.byNameList(similarNames);
    return response.map(Pokemon.fromApiModel).toList();
  }
}
