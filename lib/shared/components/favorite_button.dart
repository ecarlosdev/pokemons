import 'package:assets/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

class FavoriteButtonComponent extends StatelessWidget {
  const FavoriteButtonComponent({
    required this.isFavorite,
    required this.size,
    required this.onTap,
    this.padding,
    this.margin,
    super.key,
  });

  final EdgeInsets? padding;

  final EdgeInsets? margin;

  final bool isFavorite;

  final double size;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final favoriteIcon =
        size > 24 ? Assets.icons.favorite : Assets.icons.favoriteSm;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        child: isFavorite
            ? Assets.icons.favoriteFilled.svg(
                width: size,
                height: size,
                colorFilter: ColorFilter.mode(
                  context.theme.colors.favoriteButton,
                  BlendMode.srcIn,
                ),
              )
            : favoriteIcon.svg(
                width: size,
                height: size,
              ),
      ),
    );
  }
}
