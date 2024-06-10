import 'package:repositories/repositories.dart';

class SearchState {
  const SearchState({
    required this.status,
    required this.pokemons,
    required this.favorites,
  });

  factory SearchState.initial() {
    return const SearchState(
      status: SearchStatus.initial,
      pokemons: [],
      favorites: {},
    );
  }

  final SearchStatus status;

  final List<Pokemon> pokemons;

  final Set<int> favorites;

  SearchState copyWith({
    SearchStatus? status,
    List<Pokemon>? pokemons,
    Set<int>? favorites,
  }) {
    return SearchState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      favorites: favorites ?? this.favorites,
    );
  }
}

enum SearchStatus {
  initial,
  loading,
  loaded,
  error,
}
