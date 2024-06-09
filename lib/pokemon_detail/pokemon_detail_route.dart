import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:pokemons/pokemon_detail/pokemon_detail.dart';

class PokemonDetailRoute extends BaseRouteBuilder<void> {
  PokemonDetailRoute( {
   required super . context,
  });

  static const String name = 'pokemon_detail_route';

  @override
  Route<void> getRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const PokemonDetailPage();

      },
      settings: const RouteSettings(name: name),
    );
  }
}