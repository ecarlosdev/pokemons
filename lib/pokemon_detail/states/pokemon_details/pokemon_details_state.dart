import 'package:repositories/repositories.dart';

class PokemonDetailsState {
  const PokemonDetailsState({
    this.pokemon,
    this.loading = false,
    this.error = false,
  });

  final Pokemon? pokemon;

  final bool loading;

  final bool error;
}
