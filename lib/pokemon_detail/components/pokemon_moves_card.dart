import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/pokemon_detail/components/components.dart';
import 'package:pokemons/pokemon_detail/states/pokemon_details/pokemon_details.dart';
import 'package:pokemons/shared/widgets/widgets.dart';
import 'package:responsive/responsive.dart';

class PokemonMovesCardComponent extends StatelessWidget {
  const PokemonMovesCardComponent({
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
        return BluredContainerWidget(
          width: width,
          margin: margin,
          borderRadius: BorderRadius.circular(30),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.responsive(context),
              vertical: 30.responsive(context),
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 15.responsive(context),
              runSpacing: 15.responsive(context),
              children: List.generate(
                state.pokemon?.moves.length ?? 0,
                (index) {
                  final move = state.pokemon!.moves[index];
                  return PokemonMoveChipComponent(
                    label: move.name,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
