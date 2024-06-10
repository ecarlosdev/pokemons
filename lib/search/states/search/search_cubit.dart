import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pokemons/search/states/states.dart';
import 'package:repositories/repositories.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required PokemonRepository pokemonRepository,
    required FavoritesRepositories favoritesRepositories,
  }) : super(SearchState.initial()) {
    _pokemonRepository = pokemonRepository;
    _favoritesRepositories = favoritesRepositories;
    _subscriptions = [
      _favoritesRepositories.streamFavorites.listen((favorites) {
        emit(state.copyWith(favorites: favorites));
      }),
    ];
  }

  late final PokemonRepository _pokemonRepository;

  late final FavoritesRepositories _favoritesRepositories;

  late final List<StreamSubscription<dynamic>> _subscriptions;

  @override
  Future<void> close() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    return super.close();
  }

  Future<void> search(String search) async {
    try {
      emit(
        state.copyWith(status: SearchStatus.loading),
      );

      final pokemons = await _pokemonRepository.search(search);

      emit(
        state.copyWith(
          status: SearchStatus.loaded,
          pokemons: pokemons,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.error));
    }
  }

  Future<void> addFavorite(int pokemonId) async {
    await _favoritesRepositories.addFavorite(pokemonId);
  }

  Future<void> removeFavorite(int id) async {
    await _favoritesRepositories.removeFavorite(id);
  }
}

class NextState {
  NextState({
    required this.pokemons,
    required this.nextOffset,
    required this.nextLimit,
  });

  final List<Pokemon> pokemons;
  final int nextOffset;
  final int nextLimit;
}
