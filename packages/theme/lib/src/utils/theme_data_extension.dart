import 'package:flutter/material.dart';
import 'package:theme/src/src.dart';

/// A shortcut to access [ThemeData] extensions.
extension ThemeDataExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  ThemeColorsExtension get colors => extension<ThemeColorsExtension>()!;

  /// Usage example: Theme.of(context).appText;
  ThemeTextExtension get text => extension<ThemeTextExtension>()!;

  /// Usage example: Theme.of(context).appSizes;
  ThemeSizesExtension get sizes => extension<ThemeSizesExtension>()!;
}
