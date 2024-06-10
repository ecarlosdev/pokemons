import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:pokemons/i18n/translations.g.dart';
import 'package:pokemons/search/search.dart';
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
    return GestureDetector(
      onTap: () {
        SearchRoute(context: context).push();
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: margin,
        child: IgnorePointer(
          child: TextField(
            style: context.textStyle.field,
            decoration: InputDecoration(
              hintText: texts.home.search,
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
                borderSide: BorderSide.none,
              ),
              constraints: BoxConstraints(
                maxHeight: 40.responsive(context),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20.responsive(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
