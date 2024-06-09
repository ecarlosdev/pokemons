import 'package:flutter/material.dart';
import 'package:theme/src/src.dart';

/// A class that provides the app theme.
abstract class AppTheme {
  /// The light theme. (Add when the light theme is implemented)

  /// The dark theme.
  static ThemeData buildDarkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: ThemeExtensionsDark.colors.background,
      extensions: [
        ThemeExtensionsDark.colors,
        ThemeExtensionsDark.text(context),
        ThemeExtensionsDark.sizes(context),
      ],
    );
  }
}
