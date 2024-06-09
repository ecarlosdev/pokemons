import 'package:repositories/repositories.dart';

class HomePokemonListState {
  const HomePokemonListState({
    required this.status,
    required this.nextOffset,
    required this.nextLimit,
    required this.pokemons,
    required this.loadNextStatus,
  });

  factory HomePokemonListState.initial() {
    return const HomePokemonListState(
      status: HomePokemonListStatus.initial,
      nextLimit: 20,
      nextOffset: 0,
      pokemons: [],
      loadNextStatus: LoadNextStatus.initial,
    );
  }

  final HomePokemonListStatus status;

  final int nextOffset;

  final int nextLimit;

  final List<Pokemon> pokemons;

  final LoadNextStatus loadNextStatus;

  HomePokemonListState copyWith({
    HomePokemonListStatus? status,
    int? nextOffset,
    int? nextLimit,
    List<Pokemon>? pokemons,
    LoadNextStatus? loadNextStatus,
  }) {
    return HomePokemonListState(
      status: status ?? this.status,
      nextOffset: nextOffset ?? this.nextOffset,
      nextLimit: nextLimit ?? this.nextLimit,
      pokemons: pokemons ?? this.pokemons,
      loadNextStatus: loadNextStatus ?? this.loadNextStatus,
    );
  }
}

enum HomePokemonListStatus {
  initial,
  loading,
  loaded,
  error,
}

enum LoadNextStatus {
  initial,
  loading,
  loaded,
  error,
}
