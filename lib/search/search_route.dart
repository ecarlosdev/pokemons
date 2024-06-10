import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';
import 'package:pokemons/search/search.dart';

class SearchRoute extends BaseRouteBuilder<void> {
  SearchRoute({
    required super.context,
  });

  static const String name = 'search_route';

  @override
  Route<void> getRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      pageBuilder: (context, animation1, animation2) {
        return BlocProvider(
          create: (context) {
            return SearchCubit(
              pokemonRepository: super.context.read(),
              favoritesRepositories: super.context.read(),
            );
          },
          child: const SearchPage(),
        );
      },
      settings: const RouteSettings(name: name),
    );
  }
}
