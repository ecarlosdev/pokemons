import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';
import 'package:theme/src/src.dart';

/// A Dark theme definition.
abstract class ThemeExtensionsDark {
  /// The dark theme colors.
  static const colors = ThemeColorsExtension(
    background: Colors.black,
    onBackground: Colors.white,
  );

  /// The dark theme text styles.
  static ThemeTextExtension text(BuildContext context) {
    return ThemeTextExtension(
      headLine: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onBackground,
        fontWeight: FontWeight.w700,
        fontSize: 40.responsive(context),
      ),
      pageTitle: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onBackground,
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
        fontSize: 20.responsive(context),
      ),
      chips: TextStyle(
        package: 'theme',
        fontFamily: 'Poppins',
        color: colors.onBackground,
        fontSize: 16.responsive(context),
      ),
    );
  }
}
