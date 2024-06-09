import 'package:flutter/material.dart';
import 'package:pokemons/home/home.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveConfiguration(
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
    );
  }
}
