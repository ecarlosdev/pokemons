import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/pokemon_detail/states/pokemon_details/pokemon_details.dart';
import 'package:pokemons/shared/shared.dart';
import 'package:responsive/responsive.dart';

class PokemonCardImageComponent extends StatelessWidget {
  const PokemonCardImageComponent({
    this.width,
    this.margin,
    super.key,
  });

  final EdgeInsets? margin;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        final image = state.pokemon?.assets.image;
        return BluredContainerWidget(
          height: context.heightPercent(0.32),
          width: width,
          margin: margin,
          borderRadius: BorderRadius.circular(30),
          child: image != null
              ? Image.network(image, fit: BoxFit.fitHeight)
              : const SizedBox(),
        );
      },
    );
  }
}
