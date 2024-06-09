import 'dart:ui';

import 'package:flutter/material.dart';

/// A theme extension for sizes.
class ThemeSizesExtension extends ThemeExtension<ThemeSizesExtension> {

  /// Creates a theme extension for sizes.
  const ThemeSizesExtension({
    required this.bodySafeArea,
  });

  /// Represent the margin between the body and the screen edge.
  final double bodySafeArea;

  @override
  ThemeExtension<ThemeSizesExtension> copyWith({
    double? bodySafeArea,
  }) {
    return ThemeSizesExtension(
      bodySafeArea: bodySafeArea ?? this.bodySafeArea,
    );
  }

  @override
  ThemeExtension<ThemeSizesExtension> lerp(
    covariant ThemeExtension<ThemeSizesExtension>? other,
    double t,
  ) {
    if (other is! ThemeSizesExtension) {
      return this;
    }

    return ThemeSizesExtension(
      bodySafeArea: lerpDouble(bodySafeArea, other.bodySafeArea, t)!,
    );
  }
}
