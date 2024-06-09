import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/pokemon_detail/states/pokemon_details/pokemon_details.dart';
import 'package:pokemons/shared/widgets/widgets.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class PokemonStatsCardComponent extends StatelessWidget {
  const PokemonStatsCardComponent({
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
          padding: EdgeInsets.all(20.responsive(context)),
          borderRadius: BorderRadius.circular(30),
          child: SingleChildScrollView(
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(5),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(6),
              },
              children: [
                ...List.generate(
                  state.pokemon?.stats.length ?? 0,
                  (index) {
                    final stat = state.pokemon!.stats[index];
                    return buildTableRow(
                      context: context,
                      title: stat.name,
                      value: stat.baseStat,
                      progress: stat.baseStat / 255,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TableRow buildTableRow({
    required BuildContext context,
    required String title,
    required int value,
    required double progress,
  }) {
    return TableRow(
      children: [
        TableCell(
          child: Text(
            title,
            style: context.textStyle.body,
          ),
        ),
        TableCell(
          child: Text(
            value.toString(),
            style: context.textStyle.body.copyWith(
              color: const Color(0xffEBC974),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.responsive(context)),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12.responsive(context),
              borderRadius: BorderRadius.circular(30),
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xffEBC974),
              ),
              backgroundColor: Colors.white.withOpacity(0.3),
            ),
          ),
        ),
      ],
    );
  }
}
