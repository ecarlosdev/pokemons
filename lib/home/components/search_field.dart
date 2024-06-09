import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class SearchFieldComponent extends StatelessWidget {
  const SearchFieldComponent({
    this.margin,
    super.key,
  });

  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        style: context.textStyle.field,
        decoration: InputDecoration(
          hintText: 'Buscar',
          prefixIconConstraints: BoxConstraints(
            minWidth: 54.responsive(context),
          ),
          prefixIcon: Assets.icons.search.svg(
            colorFilter: ColorFilter.mode(
              context.colors.onFieldBackground,
              BlendMode.srcIn,
            ),
          ),
          fillColor: context.colors.fieldBackground,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.responsive(context)),
              borderSide: BorderSide.none),
          constraints: BoxConstraints(
            maxHeight: 40.responsive(context),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.responsive(context),
          ),
        ),
      ),
    );
  }
}
