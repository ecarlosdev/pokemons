import 'package:flutter/material.dart';
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
    return BluredContainerWidget(
      width: width,
      margin: margin,
      borderRadius: BorderRadius.circular(30),
      child: SingleChildScrollView(
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(3),
          },
          children: [
            ...List.generate(
              20,
              (index) => buildTableRow(
                context: context,
                title: 'HP',
                value: '100',
                progress: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow buildTableRow({
    required BuildContext context,
    required String title,
    required String value,
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
            value,
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
