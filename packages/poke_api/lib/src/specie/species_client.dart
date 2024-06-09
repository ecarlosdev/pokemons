import 'package:http/http.dart' as http;
import 'package:poke_api/src/shared/shared.dart';
import 'package:poke_api/src/specie/species.dart';

class SpeciesClient extends PokeApiV2Baseclient<Specie> {
  SpeciesClient({
    http.Client? client,
  }) : super(client: client);

  @override
  Specie mapResource(Map<String, dynamic> json) => Specie.fromJson(json);

  @override
  String get resourcePath => 'pokemon-species';
}
