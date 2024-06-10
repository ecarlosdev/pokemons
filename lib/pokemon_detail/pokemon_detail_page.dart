import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/i18n/translations.g.dart';
import 'package:pokemons/pokemon_detail/components/components.dart';
import 'package:pokemons/pokemon_detail/states/pokemon_details/pokemon_details.dart';
import 'package:pokemons/shared/shared.dart';
import 'package:pokemons/shared/utils/pokemon_type_colors.dart';
import 'package:pokemons/shared/utils/string_utils.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({super.key});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: 2,
    animationDuration: Duration.zero,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 36.responsive(context),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
          builder: (context, state) {
            return Text(
              state.pokemon?.name.capitalize() ?? '',
              style: context.textStyle.pageTitle,
            );
          },
        ),
        actions: [
          BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
            builder: (context, state) {
              final isFavorite = state.isFavorite;
              final pokemon = state.pokemon;
              return FavoriteButtonComponent(
                isFavorite: isFavorite,
                size: 36.responsive(context),
                onTap: () {
                  if (pokemon == null) return;
                  final cubit = context.read<PokemonDetailsCubit>();
                  if (isFavorite) {
                    cubit.removeFavorite(pokemon.id);
                  } else {
                    cubit.addFavorite(pokemon.id);
                  }
                },
                margin: EdgeInsets.only(right: context.sizes.bodySafeArea),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top: context.screenType == ScreenType.xsmall
                    ? constraints.maxHeight * 0.1
                    : constraints.maxHeight * 0.17,
                left: context.screenType == ScreenType.xsmall
                    ? constraints.maxWidth * 0.41
                    : constraints.maxWidth * 0.35,
                child: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
                  builder: (context, state) {
                    final color = state.pokemon?.types.first.colors.secondary ??
                        Colors.transparent;
                    return ColoredBluredCircleWidget(
                      color: color,
                      blurRadius: Platform.isAndroid ? 500 : 240,
                      spreadRadius: Platform.isAndroid ? 50 : 30,
                      size: 87.responsive(context),
                    );
                  },
                ),
              ),
              Positioned(
                top: context.screenType == ScreenType.xsmall
                    ? constraints.maxHeight * 0.70
                    : constraints.maxHeight * 0.75,
                left: constraints.maxWidth * 0.7,
                child: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
                  builder: (context, state) {
                    final color = state.pokemon?.types.first.colors.secondary ??
                        Colors.transparent;
                    return ColoredBluredCircleWidget(
                      color: color,
                      blurRadius: Platform.isAndroid ? 500 : 210,
                      spreadRadius: Platform.isAndroid ? 20 : 10,
                      size: context.screenType == ScreenType.xsmall
                          ? 120.responsive(context)
                          : 184.responsive(context),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(context.sizes.bodySafeArea).copyWith(
                  top: context.screenType == ScreenType.xsmall
                      ? 20.responsive(context)
                      : 45.responsive(context),
                  bottom: context.screenType == ScreenType.xsmall
                      ? 20.responsive(context)
                      : 45.responsive(context),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      child: PokemonCardImageComponent(
                        width: double.infinity,
                      ),
                    ),
                    PokemonInfoComponent(
                      margin: EdgeInsets.symmetric(
                        vertical: context.screenType == ScreenType.xsmall
                            ? 5.responsive(context)
                            : 5.responsive(context),
                      ),
                    ),
                    TabBar(
                      padding: EdgeInsets.only(bottom: 25.responsive(context)),
                      controller: tabController,
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: 10.responsive(context),
                        vertical: 5.responsive(context),
                      ),
                      labelStyle: context.textStyle.tabBarLabel,
                      tabs: [
                        Text(
                          texts.pokemon_details.stats.title,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          texts.pokemon_details.moves.title,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.heightPercent(0.25),
                      child: TabBarView(
                        controller: tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          PokemonStatsCardComponent(),
                          PokemonMovesCardComponent(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
