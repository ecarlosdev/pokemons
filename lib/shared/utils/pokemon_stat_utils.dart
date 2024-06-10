import 'package:pokemons/i18n/translations.g.dart';
import 'package:repositories/repositories.dart';

extension PokemonStatUtils on PokemonStat {
  String get label {
    switch (id) {
      case 1:
        return texts.pokemon_details.stats.hp;
      case 2:
        return texts.pokemon_details.stats.attack;
      case 3:
        return texts.pokemon_details.stats.specialDefense;
      case 4:
        return texts.pokemon_details.stats.defense;
      case 5:
        return texts.pokemon_details.stats.specialAttack;
      case 6:
        return texts.pokemon_details.stats.speed;
      default:
        return '';
    }
  }
}
