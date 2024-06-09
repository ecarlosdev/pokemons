import 'package:flutter/material.dart';
import 'package:pokemons/pokemon_detail/components/components.dart';
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
    return BluredContainerWidget(
      width: width,
      margin: margin,
      borderRadius: BorderRadius.circular(30),
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 15.responsive(context),
          runSpacing: 15.responsive(context),
          children: List.generate(
            20,
            (index) => const PokemonMoveChipComponent(label: 'label'),
          ),
        ),
      ),
    );
  }
}
