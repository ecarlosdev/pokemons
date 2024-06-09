import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pokemons/pokemon_detail/states/pokemon_details/pokemon_details.dart';
import 'package:repositories/repositories.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit({
    required PokemonRepository pokemonRepository,
    required FavoritesRepositories favoritesRepositories,
  }) : super(const PokemonDetailsState()) {
    _pokemonRepository = pokemonRepository;
    _favoritesRepositories = favoritesRepositories;
    _subscriptions = [
      _favoritesRepositories.streamFavorites.listen((favorites) {
        final pokemon = state.pokemon;
        if (pokemon != null) {
          emit(state.copyWith(isFavorite: favorites.contains(pokemon.id)));
        }
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

  Future<void> loadWidModel(Pokemon pokemon) async {
    emit(PokemonDetailsState(
      pokemon: pokemon,
      isFavorite: await _favoritesRepositories.isFavorite(pokemon.id),
    ));
  }

  Future<void> loadWithId(int id) async {
    emit(const PokemonDetailsState(loading: true));
    try {
      final pokemon = await _pokemonRepository.byId(id);
      if (pokemon == null) {
        emit(const PokemonDetailsState(error: true));
        return;
      }
      emit(
        PokemonDetailsState(
          pokemon: pokemon,
          isFavorite: await _favoritesRepositories.isFavorite(pokemon.id),
        ),
      );
    } catch (e) {
      emit(const PokemonDetailsState(error: true));
    }
  }

  Future<void> loadWithName(String name) async {
    emit(const PokemonDetailsState(loading: true));
    try {
      final pokemon = await _pokemonRepository.byName(name);
      if (pokemon == null) {
        emit(const PokemonDetailsState(error: true));
        return;
      }
      emit(
        PokemonDetailsState(
          pokemon: pokemon,
          isFavorite: await _favoritesRepositories.isFavorite(pokemon.id),
        ),
      );
    } catch (e) {
      emit(const PokemonDetailsState(error: true));
    }
  }

  Future<void> addFavorite(int pokemonId) async {
    await _favoritesRepositories.addFavorite(pokemonId);
  }

  Future<void> removeFavorite(int id) async {
    await _favoritesRepositories.removeFavorite(id);
  }
}
