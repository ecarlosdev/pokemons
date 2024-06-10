import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/search/components/components.dart';
import 'package:pokemons/search/states/states.dart';
import 'package:pokemons/shared/widgets/widgets.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        pokemonRepository: context.read(),
        favoritesRepositories: context.read(),
      ),
      child: const SearchPageView(),
    );
  }
}

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return CustomScrollView(
                    slivers: [
                      if (state.status == SearchStatus.error)
                        SliverFillRemaining(
                          child: Center(
                            child: MaterialButton(
                              onPressed: () {},
                              child: const Text('Intentar de nuevo'),
                            ),
                          ),
                        ),
                      SliverMainAxisGroup(
                        slivers: [
                          SliverAppBar(
                            title: const SearchFieldComponent(),
                            centerTitle: false,
                            pinned: true,
                            toolbarHeight: 65.responsive(context),
                            leading: Padding(
                              padding: EdgeInsets.only(
                                left: 10.responsive(context),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  size: 36.responsive(context),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            leadingWidth: 50.responsive(context),
                          ),
                          if (state.status == SearchStatus.loaded)
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
                      if (state.status == SearchStatus.loading)
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
