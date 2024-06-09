import 'package:repositories/repositories.dart';

class PokemonDetailsState {
  const PokemonDetailsState({
    this.pokemon,
    this.loading = false,
    this.error = false,
    this.isFavorite = false,
  });

  final Pokemon? pokemon;

  final bool isFavorite;

  final bool loading;

  final bool error;

  PokemonDetailsState copyWith({
    Pokemon? pokemon,
    bool? isFavorite,
    bool? loading,
    bool? error,
  }) {
    return PokemonDetailsState(
      pokemon: pokemon ?? this.pokemon,
      isFavorite: isFavorite ?? this.isFavorite,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
