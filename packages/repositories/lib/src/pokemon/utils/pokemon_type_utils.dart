import 'package:repositories/src/pokemon/models/models.dart';

/// Utils for PokemonType.
abstract class PokemonTypeUtils {

  /// Convert a pokemon type name to a PokemonType enum.
  static PokemonType fromFromPrimitive(String type) {
    switch (type) {
      case 'normal':
        return PokemonType.normal;
      case 'fighting':
        return PokemonType.fighting;
      case 'flying':
        return PokemonType.flying;
      case 'poison':
        return PokemonType.poison;
      case 'ground':
        return PokemonType.ground;
      case 'rock':
        return PokemonType.rock;
      case 'bug':
        return PokemonType.bug;
      case 'ghost':
        return PokemonType.ghost;
      case 'steel':
        return PokemonType.steel;
      case 'fire':
        return PokemonType.fire;
      case 'water':
        return PokemonType.water;
      case 'grass':
        return PokemonType.grass;
      case 'electric':
        return PokemonType.electric;
      case 'psychic':
        return PokemonType.psychic;
      case 'ice':
        return PokemonType.ice;
      case 'dragon':
        return PokemonType.dragon;
      case 'dark':
        return PokemonType.dark;
      case 'fairy':
        return PokemonType.fairy;
      default:
        return PokemonType.unknown;
    }
  }
}
