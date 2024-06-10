import 'package:poke_api/poke_api.dart' as poke_api;
import 'package:repositories/src/pokemon/models/models.dart';
import 'package:repositories/src/pokemon/utils/utils.dart';

/// Represents a Pokemon.
class Pokemon {
  /// Creates a Pokemon.
  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.stats,
    required this.moves,
    required this.assets,
    required this.weight,
    required this.height,
  });

  factory Pokemon.fromApiModel(poke_api.Pokemon pokemon) {
    return Pokemon(
      id: pokemon.id,
      name: pokemon.name,
      types: pokemon.types
          .map((t) => t.type.name)
          .map(PokemonTypeUtils.fromFromPrimitive)
          .toList(),
      stats: pokemon.stats
          .map(
            (s) => PokemonStat(
              id: s.stat.id,
              name: s.stat.name,
              baseStat: s.baseStat,
            ),
          )
          .toList(),
      moves: pokemon.moves.map((m) => PokemonMove(name: m.move.name)).toList(),
      assets: PokemonAssets(
        image: pokemon.sprites.other?.officialArtwork.frontDefault ??
            pokemon.sprites.frontDefault ??
            pokemon.sprites.other?.dreamWorld.frontDefault ??
            '',
      ),
      weight: pokemon.weight,
      height: pokemon.height,
    );
  }

  /// Id of the Pokemon.
  final int id;

  /// Name of the Pokemon.
  final String name;

  /// Bug, fire, water, etc.
  final List<PokemonType> types;

  /// Hp, attack, defense, etc.
  final List<PokemonStat> stats;

  /// Moves that the Pokemon can learn.
  final List<PokemonMove> moves;

  /// Assets for this Pokemon.
  final PokemonAssets assets;

  /// Pokemon's weight in hectograms.
  final int weight;

  /// Pokemon's height in decimetres.
  final int height;

  double get heightInMeters => double.parse((height / 10).toStringAsFixed(1));

  double get weightInKg => double.parse((weight / 10).toStringAsFixed(1));
}
