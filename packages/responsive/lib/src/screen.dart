import 'package:flutter/widgets.dart';
import 'package:responsive/src/src.dart';

/// A screen shortcut for [MediaQuery] properties and utilities.
extension Screen on BuildContext {

  /// Returns screen type as defined in [ScreenType]
  ScreenType get screenType {
    final mediaQuery = MediaQuery.of(this);
    if (mediaQuery.size.shortestSide < 600) {
      return ScreenType.small;
    } else if (mediaQuery.size.shortestSide < 1200) {
      return ScreenType.medium;
    } else {
      return ScreenType.large;
    }
  }

  /// Shortcut for MediaQuery.of(context).orientation.
  Orientation get orientation {
    return MediaQuery.of(this).orientation;
  }
}
