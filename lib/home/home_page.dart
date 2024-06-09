import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:pokemons/home/components/components.dart';
import 'package:pokemons/shared/widgets/widgets.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Assets.icons.hamburgerMenu.svg(
            width: 26.responsive(context),
            height: 18.responsive(context),
          ),
        ),
        actions: const [
          UserButtonComponent(),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned(
                top: constraints.maxHeight / 2 - 92.responsive(context),
                left: constraints.maxWidth / 2 - 92.responsive(context),
                child: ColoredBluredCircleWidget(
                  color: const Color(0xffB57C4C),
                  size: 184.responsive(context),
                ),
              ),
              Positioned(
                top: constraints.maxHeight - constraints.maxHeight / 3,
                right: -92.responsive(context),
                child: ColoredBluredCircleWidget(
                  color: const Color(0xff82B8CA),
                  size: 184.responsive(context),
                ),
              ),
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(context.sizes.bodySafeArea),
                      child: Text(
                        'Encuentra tu Pokémon',
                        style: context.textStyle.headLine,
                      ),
                    ),
                  ),
                  SliverMainAxisGroup(
                    slivers: [
                      SliverAppBar(
                        floating: true,
                        title: const SearchFieldComponent(),
                        centerTitle: false,
                        toolbarHeight: 65.responsive(context),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.all(
                          context.sizes.bodySafeArea,
                        ).copyWith(
                          bottom: MediaQuery.of(context).padding.bottom +
                              context.sizes.bodySafeArea,
                        ),
                        sliver: SliverGrid.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.responsive(context),
                            mainAxisSpacing: 15.responsive(context),
                            childAspectRatio: 1.06214689266,
                          ),
                          itemBuilder: (context, index) {
                            return const PokemonTileComponent();
                          },
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
