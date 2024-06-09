import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class PokemonMoveChipComponent extends StatelessWidget {
  const PokemonMoveChipComponent({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.responsive(context),
        vertical: 8.responsive(context),
      ),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: const StadiumBorder(),
      ),
      child: Text(
        label,
        style: context.textStyle.chips,
      ),
    );
  }
}
