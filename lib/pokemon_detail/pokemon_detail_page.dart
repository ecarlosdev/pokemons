import 'package:flutter/material.dart';
import 'package:pokemons/pokemon_detail/components/components.dart';
import 'package:pokemons/shared/shared.dart';
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
        title: Text(
          'Pikachu',
          style: context.textStyle.pageTitle,
        ),
        actions: [
          FavoriteButtonComponent(
            isFavorite: true,
            size: 36.responsive(context),
            onTap: () {},
            margin: EdgeInsets.only(right: context.sizes.bodySafeArea),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top: constraints.maxHeight * 0.17,
                left: constraints.maxWidth * 0.35,
                child: ColoredBluredCircleWidget(
                  color: const Color(0xFFF1C346),
                  blurRadius: 240,
                  spreadRadius: 30,
                  size: 87.responsive(context),
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.74,
                left: constraints.maxWidth * 0.7,
                child: ColoredBluredCircleWidget(
                  color: const Color(0xFF82B8CA),
                  blurRadius: 210,
                  spreadRadius: 10,
                  size: 184.responsive(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(context.sizes.bodySafeArea).copyWith(
                  top: 50.responsive(context),
                  bottom: 50.responsive(context),
                ),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: PokemonCardImageComponent(
                        width: double.infinity,
                      ),
                    ),
                    PokemonInfoComponent(
                      margin: EdgeInsets.symmetric(
                        vertical: 20.responsive(context),
                      ),
                    ),
                    TabBar(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.responsive(context),
                      ),
                      controller: tabController,
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: 10.responsive(context),
                        vertical: 5.responsive(context),
                      ),
                      labelStyle: context.textStyle.tabBarLabel,
                      tabs: const [
                        Text(
                          'Stats',
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Moves',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 3,
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
