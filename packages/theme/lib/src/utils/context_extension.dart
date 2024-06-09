import 'package:flutter/material.dart';
import 'package:theme/src/src.dart';

/// Shortcut to access the [Theme] properties.
extension AppThemeExtension on BuildContext {
  /// Usage example: context.theme
  ThemeData get theme => Theme.of(this);

  /// Usage example: context.colors.background
  ThemeColorsExtension get colors => theme.colors;

  /// Usage example: context.text.headLine
  ThemeTextExtension get textStyle => theme.text;

  /// Usage example: context.sizes.padding
  ThemeSizesExtension get sizes => theme.sizes;
}
