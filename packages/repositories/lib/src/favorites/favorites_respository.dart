import 'dart:async';

import 'package:repositories/src/favorites/data_source/data_source.dart';

class FavoritesRepositories {
  FavoritesRepositories(FavoritesLocalDataSource localDataSource) {
    _localDataSource = localDataSource;
    _localDataSource.getFavorites().then(_favoritesController.add);
  }

  late final FavoritesLocalDataSource _localDataSource;

  final _favoritesController = StreamController<Set<int>>.broadcast();

  Stream<Set<int>> get streamFavorites {
    return _favoritesController.stream;
  }

  Future<void> addFavorite(int pokemonId) async {
    await _localDataSource.addFavorite(pokemonId);
    _favoritesController.add(await _localDataSource.getFavorites());
  }

  Future<void> removeFavorite(int pokemonId) async {
    await _localDataSource.removeFavorite(pokemonId);
    _favoritesController.add(await _localDataSource.getFavorites());
  }

  Future<bool> isFavorite(int pokemonId) async {
    return (await _localDataSource.getFavorites()).contains(pokemonId);
  }
}
