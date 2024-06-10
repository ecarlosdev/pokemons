import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/home/states/states.dart';
import 'package:pokemons/pokemon_detail/pokemon_detail.dart';
import 'package:pokemons/shared/shared.dart';
import 'package:pokemons/shared/utils/pokemon_type_colors.dart';
import 'package:pokemons/shared/utils/string_utils.dart';
import 'package:repositories/repositories.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class PokemonTileComponent extends StatelessWidget {
  const PokemonTileComponent({
    required this.pokemon,
    super.key,
  });

  static const double _tileSafeArea = 10;

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(_tileSafeArea),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                pokemon.colors.primary,
                pokemon.colors.primary.withOpacity(0.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 20.responsive(context),
          ),
          child: Image.network(
            pokemon.assets.image,
            width: 135.responsive(context),
            height: 135.responsive(context),
            fit: BoxFit.fitHeight,
          ),
        ),
        Positioned(
          bottom: _tileSafeArea,
          right: _tileSafeArea,
          child: Assets.icons.arrowRightRounded.svg(
            width: 20.responsive(context),
            height: 20.responsive(context),
          ),
        ),
        Positioned(
          bottom: _tileSafeArea,
          left: _tileSafeArea,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 200.responsive(context),
            ),
            child: Text(
              pokemon.name.capitalize(),
              style: context.textStyle.body.copyWith(
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: PokemonDetailRoute(
              context: context,
              pokemon: pokemon,
            ).push,
          ),
        ),
        Positioned(
          top: _tileSafeArea,
          left: _tileSafeArea,
          child: BlocBuilder<HomePokemonListCubit, HomePokemonListState>(
            builder: (context, state) {
              final isFavorite = state.favorites.contains(pokemon.id);
              return FavoriteButtonComponent(
                isFavorite: isFavorite,
                onTap: () {
                  final cubit = context.read<HomePokemonListCubit>();
                  if (isFavorite) {
                    cubit.removeFavorite(pokemon.id);
                    return;
                  } else {
                    cubit.addFavorite(pokemon.id);
                  }
                  context.read<HomePokemonListCubit>().addFavorite(pokemon.id);
                },
                size: 20.responsive(context),
              );
            },
          ),
        ),
      ],
    );
  }
}
