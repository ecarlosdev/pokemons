import 'package:flutter/material.dart';

/// A custom theme extension for defining additional color properties
/// in your application's theme.
class ThemeColorsExtension extends ThemeExtension<ThemeColorsExtension> {
  /// Creates a [ThemeColorsExtension] with the given color properties.
  const ThemeColorsExtension({
    required this.background,
    required this.onBackground,
    required this.fieldBackground,
    required this.onFieldBackground,
    required this.favoriteButton,
  });

  /// The background color used for the primary surfaces of your UI.
  final Color background;

  /// The color used for text and icons placed on the background.
  final Color onBackground;

  /// The background color used for input fields and similar elements.
  final Color fieldBackground;

  /// The color used for text and icons placed on input fields and
  /// similar elements.
  final Color onFieldBackground;

  /// The color used for favorite buttons or similar interactive elements.
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
