import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/pokemon_detail/states/pokemon_details/pokemon_details.dart';
import 'package:pokemons/shared/utils/pokemon_type_colors.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class PokemonInfoComponent extends StatelessWidget {
  const PokemonInfoComponent({
    this.margin,
    this.padding,
    super.key,
  });

  final EdgeInsets? margin;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
      builder: (context, state) {
        final typeImage = state.pokemon?.types.first.asset;
        return Container(
          margin: margin,
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PokemonDatum(
                value: "${state.pokemon?.heightInMeters.toString() ?? ''} M",
                label: 'Height',
              ),
              if (typeImage != null)
                Image(
                  image: typeImage,
                  width: 100.responsive(context),
                  height: 100.responsive(context),
                ),
              PokemonDatum(
                value: "${state.pokemon?.weightInKg.toString() ?? ''} KG",
                label: 'Weight',
              ),
            ],
          ),
        );
      },
    );
  }
}

class PokemonDatum extends StatelessWidget {
  const PokemonDatum({
    required this.value,
    required this.label,
    super.key,
  });

  final String value;

  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textStyle.body.copyWith(
            fontSize: 20.responsive(context),
            fontWeight: FontWeight.w700,
            color: context.colors.onBackground,
          ),
        ),
        Text(
          label,
          style: context.textStyle.body.copyWith(
            fontSize: 12.responsive(context),
            color: context.colors.onBackground,
          ),
        ),
      ],
    );
  }
}
