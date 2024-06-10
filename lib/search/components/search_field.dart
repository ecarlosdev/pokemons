import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/i18n/translations.g.dart';
import 'package:pokemons/search/states/states.dart';
import 'package:pokemons/shared/utils/utils.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class SearchFieldComponent extends StatefulWidget {
  const SearchFieldComponent({
    this.margin,
    super.key,
  });

  final EdgeInsets? margin;

  @override
  State<SearchFieldComponent> createState() => _SearchFieldComponentState();
}

class _SearchFieldComponentState extends State<SearchFieldComponent> {
  late final debouncer = Debouncer(
    duration: const Duration(
      milliseconds: 700,
    ),
  );

  void onChanged(String value) {
    debouncer.run(() {
      context.read<SearchCubit>().search(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextField(
        autofocus: true,
        style: context.textStyle.field,
        onChanged: onChanged,
        cursorHeight: 23.responsive(context),
        cursorColor: context.colors.onFieldBackground,
        decoration: InputDecoration(
          hintText: texts.home.search,
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
    );
  }
}
