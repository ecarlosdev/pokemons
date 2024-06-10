import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/src/src.dart';

/// A Dark theme definition.
abstract class ThemeExtensionsDark {
  /// The dark theme colors.
  static final colors = ThemeColorsExtension(
    background: Colors.black,
    onBackground: Colors.white,
    fieldBackground: Colors.white.withAlpha(76),
    onFieldBackground: Colors.white.withAlpha(153),
    favoriteButton: const Color(0xffFE0505),
  );

  /// The dark theme sizes.
  static ThemeSizesExtension sizes(BuildContext context) {
    return ThemeSizesExtension(
      bodySafeArea: 15.responsive(context),
    );
  }

  /// The dark theme text styles.
  static ThemeTextExtension text(BuildContext context) {
    return ThemeTextExtension(
      headLine: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onBackground,
        fontWeight: FontWeight.w700,
        fontSize: 40.responsive(context),
        height: 1.35,
      ),
      pageTitle: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onBackground,
        fontWeight: FontWeight.w700,
        fontSize: 40.responsive(context),
      ),
      body: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onBackground,
        fontSize: 16.responsive(context),
      ),
      tabBarLabel: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onBackground,
        fontWeight: FontWeight.w700,
        fontSize: 20.responsive(context),
      ),
      chips: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onBackground,
        fontWeight: FontWeight.w400,
        fontSize: 16.responsive(context),
      ),
      field: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onFieldBackground,
        fontWeight: FontWeight.w400,
        fontSize: 20.responsive(context),
      ),
    );
  }
}
