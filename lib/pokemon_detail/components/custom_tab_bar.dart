import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/theme.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({
    required this.tabController,
    this.margin,
    this.padding,
    super.key,
  });

  final TabController tabController;

  final EdgeInsets? margin;

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Tab(
            tabController: tabController,
            label: 'Stats',
            index: 0,
          ),
          Tab(
            tabController: tabController,
            label: 'Moves',
            index: 1,
          ),
        ],
      ),
    );
  }
}

class Tab extends StatelessWidget {
  const Tab({
    required this.tabController,
    required this.label,
    required this.index,
    super.key,
  });

  final TabController tabController;

  final String label;

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: tabController,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            tabController.animateTo(index);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.responsive(context),
              vertical: 10.responsive(context),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: tabController.index == index
                        ? context.colors.onBackground
                        : Colors.transparent,
                    width: 2.responsive(context),
                  ),
                ),
              ),
              child: Text(
                label,
                style: context.textStyle.tabBarLabel,
              ),
            ),
          ),
        );
      },
    );
  }
}
