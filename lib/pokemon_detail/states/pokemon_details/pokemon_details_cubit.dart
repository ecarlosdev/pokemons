import 'package:bloc/bloc.dart';
import 'package:pokemons/pokemon_detail/states/pokemon_details/pokemon_details.dart';
import 'package:repositories/repositories.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit({
    required PokemonRepository pokemonRepository,
  }) : super(const PokemonDetailsState()) {
    _pokemonRepository = pokemonRepository;
  }

  late final PokemonRepository _pokemonRepository;

  Future<void> loadWidModel(Pokemon pokemon) async {
    emit(PokemonDetailsState(pokemon: pokemon));
  }

  Future<void> loadWithId(int id) async {
    emit(const PokemonDetailsState(loading: true));
    try {
      final pokemon = await _pokemonRepository.byId(id);
      if (pokemon == null) {
        emit(const PokemonDetailsState(error: true));
        return;
      }
      emit(PokemonDetailsState(pokemon: pokemon));
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
      emit(PokemonDetailsState(pokemon: pokemon));
    } catch (e) {
      emit(const PokemonDetailsState(error: true));
    }
  }
}
