import 'package:http/http.dart';
import 'package:poke_api/src/src.dart';

class PokeApi {
  PokeApi({Client? baseClient}) {
    _baseClient = baseClient ?? Client();
  }

  late final Client _baseClient;

  PokemonClient get pokemon => PokemonClient(client: _baseClient);
}
