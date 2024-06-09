import 'package:flutter/material.dart';
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
    return Container(
      margin: margin,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const PokemonDatum(
            value: '0.4 m',
            label: 'Height',
          ),
          Placeholder(
            fallbackHeight: 64.responsive(context),
            fallbackWidth: 64.responsive(context),
          ),
          const PokemonDatum(
            value: '7.5 kg',
            label: 'Weight',
          ),
        ],
      ),
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
