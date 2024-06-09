import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/home/components/components.dart';
import 'package:pokemons/home/states/states.dart';
import 'package:pokemons/shared/widgets/widgets.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePokemonListCubit(
        pokemonRepository: context.read(),
      )..load(),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late final ScrollController scrollController = ScrollController()
    ..addListener(listener);

  void listener() {
    final listCubit = context.read<HomePokemonListCubit>();
    final offsetPosition = scrollController.offset + 75 >=
        scrollController.position.maxScrollExtent;
    final outOfRange = scrollController.position.outOfRange;
    final loadingMore =
        listCubit.state.loadNextStatus == LoadNextStatus.loading;
    if (offsetPosition && !outOfRange && !loadingMore) {
      listCubit.loadNext();
    }
  }

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
                  color: const Color(0xffB57C4C).withOpacity(0.4),
                  size: 184.responsive(context),
                ),
              ),
              Positioned(
                top: constraints.maxHeight - constraints.maxHeight / 3,
                right: -92.responsive(context),
                child: ColoredBluredCircleWidget(
                  color: const Color(0xff82B8CA).withOpacity(0.4),
                  size: 184.responsive(context),
                ),
              ),
              BlocBuilder<HomePokemonListCubit, HomePokemonListState>(
                builder: (context, state) {
                  return CustomScrollView(
                    controller: scrollController,
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
                      if (state.status == HomePokemonListStatus.error)
                        SliverFillRemaining(
                          child: Center(
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text('Intentar de nuevo'),
                            ),
                          ),
                        ),
                      if (state.status == HomePokemonListStatus.loaded)
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
                                  return PokemonTileComponent(
                                    pokemon: state.pokemons[index],
                                  );
                                },
                                itemCount: state.pokemons.length,
                              ),
                            ),
                          ],
                        ),
                      if (state.status == HomePokemonListStatus.loading)
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
                                  return const BluredContainerWidget();
                                },
                                itemCount: 10,
                              ),
                            ),
                          ],
                        ),
                      if (state.loadNextStatus == LoadNextStatus.loading)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).padding.bottom +
                                  context.sizes.bodySafeArea,
                            ),
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                  context.colors.onBackground,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
