import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:pokemons/pokemon_detail/pokemon_detail.dart';
import 'package:pokemons/pokemon_detail/states/pokemon_details/pokemon_details_cubit.dart';
import 'package:repositories/repositories.dart';

class PokemonDetailRoute extends BaseRouteBuilder<void> {
  PokemonDetailRoute({
    required super.context,
    this.pokemonName,
    this.pokemonId,
    this.pokemon,
  });

  static const String name = 'pokemon_detail_route';

  final String? pokemonName;

  final int? pokemonId;

  final Pokemon? pokemon;

  @override
  Route<void> getRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) {
            final cubit = PokemonDetailsCubit(
              pokemonRepository: super.context.read(),
              favoritesRepositories: super.context.read(),
            );
            if (pokemon != null) {
              cubit.loadWidModel(pokemon!);
            } else if (pokemonId != null) {
              cubit.loadWithId(pokemonId!);
            } else if (pokemonName != null) {
              cubit.loadWithName(pokemonName!);
            }
            return cubit;
          },
          child: const PokemonDetailPage(),
        );
      },
      settings: const RouteSettings(name: name),
    );
  }
}
