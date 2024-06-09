import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';

class PokemonTypeColors {
  const PokemonTypeColors({
    required this.primary,
    required this.secondary,
  });

  final Color primary;
  final Color secondary;

  Gradient get gradient {
    return LinearGradient(
      colors: [primary, secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}

extension PokemonTypeUtils on PokemonType {
  PokemonTypeColors get colors {
    switch (this) {
      case PokemonType.normal:
        return const PokemonTypeColors(
          primary: Color(0xFF929292),
          secondary: Color(0xFFA4A4A2),
        );
      case PokemonType.fighting:
        return const PokemonTypeColors(
          primary: Color(0xFFCF424D),
          secondary: Color(0xFFE83F47),
        );
      case PokemonType.flying:
        return const PokemonTypeColors(
          primary: Color(0xFF8FA8D0),
          secondary: Color(0xFFA4C1F7),
        );
      case PokemonType.poison:
        return const PokemonTypeColors(
          primary: Color(0xFFA75B8E),
          secondary: Color(0xFFC16BDA),
        );
      case PokemonType.ground:
        return const PokemonTypeColors(
          primary: Color(0xFFDB6B3A),
          secondary: Color(0xFFD25C64),
        );
      case PokemonType.rock:
        return const PokemonTypeColors(
          primary: Color(0xFFC4B78A),
          secondary: Color(0xFFD6CC8E),
        );
      case PokemonType.bug:
        return const PokemonTypeColors(
          primary: Color(0xFFB0C12B),
          secondary: Color(0xFF92BD1F),
        );
      case PokemonType.ghost:
        return const PokemonTypeColors(
          primary: Color(0xFF526AA3),
          secondary: Color(0xFF7769A7),
        );
      case PokemonType.steel:
        return const PokemonTypeColors(
          primary: Color(0xFF526AA3),
          secondary: Color(0xFF59A5A5),
        );
      case PokemonType.fire:
        return const PokemonTypeColors(
          primary: Color(0xFFF97D51),
          secondary: Color(0xFFF8AD44),
        );
      case PokemonType.water:
        return const PokemonTypeColors(
          primary: Color(0xFF4A90DA),
          secondary: Color(0xFF69B3E7),
        );
      case PokemonType.grass:
        return const PokemonTypeColors(
          primary: Color(0xFF5DBE62),
          secondary: Color(0xFF5ED15F),
        );
      case PokemonType.electric:
        return const PokemonTypeColors(
          primary: Color(0xFFF6D54A),
          secondary: Color(0xFFFAD961),
        );
      case PokemonType.psychic:
        return const PokemonTypeColors(
          primary: Color(0xFFFA8581),
          secondary: Color(0xFFF48FB1),
        );
      case PokemonType.ice:
        return const PokemonTypeColors(
          primary: Color(0xFF5AC1C1),
          secondary: Color(0xFF8AD1D1),
        );
      case PokemonType.dragon:
        return const PokemonTypeColors(
          primary: Color(0xFF92B3E1),
          secondary: Color(0xFFB0C1EA),
        );
      case PokemonType.dark:
        return const PokemonTypeColors(
          primary: Color(0xFF5A5A5A),
          secondary: Color(0xFF6E7885),
        );
      case PokemonType.fairy:
        return const PokemonTypeColors(
          primary: Color(0xFFF16E98),
          secondary: Color(0xFFF5A5B3),
        );
      case PokemonType.unknown:
        return const PokemonTypeColors(
          primary: Color(0xFF929292),
          secondary: Color(0xFFA4A4A2),
        );
    }
  }

  ImageProvider get asset {
    switch (this) {
      case PokemonType.normal:
        return Assets.images.pokemonTypes.normal.provider();
      case PokemonType.fighting:
        return Assets.images.pokemonTypes.fighting.provider();
      case PokemonType.flying:
        return Assets.images.pokemonTypes.flying.provider();
      case PokemonType.poison:
        return Assets.images.pokemonTypes.poison.provider();
      case PokemonType.ground:
        return Assets.images.pokemonTypes.ground.provider();
      case PokemonType.rock:
        return Assets.images.pokemonTypes.rock.provider();
      case PokemonType.bug:
        return Assets.images.pokemonTypes.bug.provider();
      case PokemonType.ghost:
        return Assets.images.pokemonTypes.ghost.provider();
      case PokemonType.steel:
        return Assets.images.pokemonTypes.steel.provider();
      case PokemonType.fire:
        return Assets.images.pokemonTypes.fire.provider();
      case PokemonType.water:
        return Assets.images.pokemonTypes.water.provider();
      case PokemonType.grass:
        return Assets.images.pokemonTypes.grass.provider();
      case PokemonType.electric:
        return Assets.images.pokemonTypes.electric.provider();
      case PokemonType.psychic:
        return Assets.images.pokemonTypes.psychic.provider();
      case PokemonType.ice:
        return Assets.images.pokemonTypes.ice.provider();
      case PokemonType.dragon:
        return Assets.images.pokemonTypes.dragon.provider();
      case PokemonType.dark:
        return Assets.images.pokemonTypes.dark.provider();
      case PokemonType.fairy:
        return Assets.images.pokemonTypes.fairy.provider();
      case PokemonType.unknown:
        return Assets.images.pokemonTypes.normal.provider();
    }
  }
}

extension PokemonsColors on Pokemon {
  PokemonTypeColors get colors => types.first.colors;
}
