import 'package:pokemons/app/app.dart';
import 'package:pokemons/bootstrap.dart';
import 'package:repositories/repositories.dart';

void main() {
  bootstrap(
    () => App(
      pokeApi: PokeApi(),
    ),
  );
}
