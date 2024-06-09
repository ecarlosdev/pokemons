import 'package:flutter/material.dart';
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
    return BluredContainerWidget(
      height: 316.responsive(context),
      width: width,
      margin: margin,
      borderRadius: BorderRadius.circular(30),
      child: const Placeholder(),
    );
  }
}
