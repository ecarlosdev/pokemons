import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:pokemons/pokemon_detail/pokemon_detail.dart';
import 'package:pokemons/shared/shared.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class PokemonTileComponent extends StatelessWidget {
  const PokemonTileComponent({super.key});

  static const double _tileSafeArea = 10;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            PokemonDetailRoute(context: context).push();
          },
          child: Container(
            padding: const EdgeInsets.all(_tileSafeArea),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.yellow[700]!,
                  Colors.yellow[700]!.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 20.responsive(context),
          ),
          child: Placeholder(
            color: Colors.black,
            child: SizedBox(
              width: 130.responsive(context),
              height: 130.responsive(context),
            ),
          ),
        ),
        Positioned(
          top: _tileSafeArea,
          left: _tileSafeArea,
          child: FavoriteButtonComponent(
            isFavorite: true,
            onTap: () {},
            size: 20.responsive(context),
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
              'Squirtle',
              style: context.textStyle.body.copyWith(
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
