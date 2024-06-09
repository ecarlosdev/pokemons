import 'package:flutter/material.dart';

class ThemeColorsExtension extends ThemeExtension<ThemeColorsExtension> {
  const ThemeColorsExtension({
    required this.background,
    required this.onBackground,
    required this.fieldBackground,
    required this.onFieldBackground,
    required this.favoriteButton,
  });

  final Color background;

  final Color onBackground;

  final Color fieldBackground;

  final Color onFieldBackground;

  final Color favoriteButton;

  @override
  ThemeExtension<ThemeColorsExtension> copyWith({
    Color? background,
    Color? onBackground,
    Color? fieldBackground,
    Color? onFieldBackground,
    Color? favoriteButton,
  }) {
    return ThemeColorsExtension(
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      fieldBackground: fieldBackground ?? this.fieldBackground,
      onFieldBackground: onFieldBackground ?? this.onFieldBackground,
      favoriteButton: favoriteButton ?? this.favoriteButton,
    );
  }

  @override
  ThemeExtension<ThemeColorsExtension> lerp(
    covariant ThemeExtension<ThemeColorsExtension>? other,
    double t,
  ) {
    if (other is! ThemeColorsExtension) {
      return this;
    }

    return ThemeColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      fieldBackground: Color.lerp(fieldBackground, other.fieldBackground, t)!,
      onFieldBackground:
          Color.lerp(onFieldBackground, other.onFieldBackground, t)!,
      favoriteButton: Color.lerp(favoriteButton, other.favoriteButton, t)!,
    );
  }
}
