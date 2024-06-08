import 'package:flutter/material.dart';

class ThemeColorsExtension extends ThemeExtension<ThemeColorsExtension> {
  const ThemeColorsExtension({
    required this.background,
    required this.onBackground,
  });

  final Color background;

  final Color onBackground;

  @override
  ThemeExtension<ThemeColorsExtension> copyWith({
    Color? background,
    Color? onBackground,
  }) {
    return ThemeColorsExtension(
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
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
    );
  }
}
