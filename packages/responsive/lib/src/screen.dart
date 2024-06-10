import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:responsive/src/src.dart';

/// A screen shortcut for [MediaQuery] properties and utilities.
extension Screen on BuildContext {
  /// Returns screen type as defined in [ScreenType]
  ScreenType get screenType {
    final mediaQuery = MediaQuery.of(this);
    final screenDiagonalSize = sqrt(
      mediaQuery.size.width * mediaQuery.size.width +
          mediaQuery.size.height * mediaQuery.size.height,
    );
    if (screenDiagonalSize < 900) {
      return ScreenType.xsmall;
    } else if (screenDiagonalSize < 1200) {
      return ScreenType.small;
    } else if (screenDiagonalSize < 1920) {
      return ScreenType.medium;
    } else {
      return ScreenType.large;
    }
  }

  /// Return a percentage of the screen height.
  double heightPercent(double percent) {
    return MediaQuery.of(this).size.height * percent;
  }

  /// Return a percentage of the screen width.
  double widthPercent(double percent) {
    return MediaQuery.of(this).size.width * percent;
  }

  /// Shortcut for MediaQuery.of(context).orientation.
  Orientation get orientation {
    return MediaQuery.of(this).orientation;
  }
}
