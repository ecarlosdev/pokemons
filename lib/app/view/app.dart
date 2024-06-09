import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/home/home.dart';
import 'package:repositories/repositories.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class App extends StatelessWidget {
  const App({
    required this.pokeApi,
    super.key,
  });

  final PokeApi pokeApi;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PokemonRepository(pokeApi),
        ),
      ],
      child: ResponsiveConfiguration(
        smallDesignSize: const Size(428, 926),
        mediumDesignSize: const Size(768, 1024),
        largeDesignSize: const Size(1440, 1024),
        child: Builder(
          builder: (context) {
            return MaterialApp(
              theme: AppTheme.buildDarkTheme(context),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
