import 'package:shared_preferences/shared_preferences.dart';

class FavoritesLocalDataSource {
  FavoritesLocalDataSource(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  late final SharedPreferences _sharedPreferences;

  static const _favoritesKey = 'favorites';

  Future<Set<int>> getFavorites() async {
    return _sharedPreferences
            .getStringList(_favoritesKey)
            ?.map(int.parse)
            .toSet() ??
        {};
  }

  Future<void> addFavorite(int pokemonId) async {
    final favorites = await getFavorites();
    favorites.add(pokemonId);
    await _sharedPreferences.setStringList(
      _favoritesKey,
      favorites.map((e) => e.toString()).toList(),
    );
  }

  Future<void> removeFavorite(int pokemonId) async {
    final favorites = await getFavorites();
    favorites.remove(pokemonId);
    await _sharedPreferences.setStringList(
      _favoritesKey,
      favorites.map((e) => e.toString()).toList(),
    );
  }

  Future<bool> isFavorite(int pokemonId) async {
    final favorites = await getFavorites();
    return favorites.contains(pokemonId);
  }
}
