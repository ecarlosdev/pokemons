import 'package:flutter/material.dart';
import 'package:pokemons/home/home.dart';
import 'package:responsive/responsive.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveConfiguration(
      smallDesignSize: const Size(360, 640),
      mediumDesignSize: const Size(768, 1024),
      largeDesignSize: const Size(1440, 1024),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
