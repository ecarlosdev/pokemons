import 'package:bloc/bloc.dart';
import 'package:pokemons/home/states/home_pokemon_list/home_pokemon_list_state.dart';
import 'package:repositories/repositories.dart';

class HomePokemonListCubit extends Cubit<HomePokemonListState> {
  HomePokemonListCubit({
    required PokemonRepository pokemonRepository,
  }) : super(HomePokemonListState.initial()) {
    _pokemonRepository = pokemonRepository;
  }

  late final PokemonRepository _pokemonRepository;

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
