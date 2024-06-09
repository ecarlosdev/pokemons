import 'package:pokemons/app/app.dart';
import 'package:pokemons/bootstrap.dart';
import 'package:repositories/repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  bootstrap(
    () async {
      final sharedPreferences = await SharedPreferences.getInstance();
      return App(
        pokeApi: PokeApi(),
        favoritesLocalDataSource: FavoritesLocalDataSource(sharedPreferences),
      );
    },
  );
}
