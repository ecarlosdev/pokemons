import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pokemons/home/states/home_pokemon_list/home_pokemon_list_state.dart';
import 'package:repositories/repositories.dart';

class HomePokemonListCubit extends Cubit<HomePokemonListState> {
  HomePokemonListCubit({
    required PokemonRepository pokemonRepository,
    required FavoritesRepositories favoritesRepositories,
  }) : super(HomePokemonListState.initial()) {
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

  Future<void> load() async {
    try {
      emit(state.copyWith(status: HomePokemonListStatus.loading));

      final nextState = await _loadNext();

      emit(
        state.copyWith(
          status: HomePokemonListStatus.loaded,
          pokemons: nextState.pokemons,
          nextOffset: nextState.nextOffset,
          nextLimit: nextState.nextLimit,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: HomePokemonListStatus.error));
    }
  }

  Future<void> loadNext() async {
    try {
      emit(state.copyWith(loadNextStatus: LoadNextStatus.loading));

      final nextState = await _loadNext();

      emit(
        state.copyWith(
          loadNextStatus: LoadNextStatus.loaded,
          pokemons: [...state.pokemons, ...nextState.pokemons],
          nextOffset: nextState.nextOffset,
          nextLimit: nextState.nextLimit,
        ),
      );
    } catch (e) {
      emit(state.copyWith(loadNextStatus: LoadNextStatus.error));
    }
  }

  Future<NextState> _loadNext() async {
    final pokemonList = await _pokemonRepository.list(
      offset: state.nextOffset,
      limit: state.nextLimit,
    );

    return NextState(
      pokemons: pokemonList.results,
      nextOffset: pokemonList.nextOffset,
      nextLimit: pokemonList.nextLimit,
    );
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
