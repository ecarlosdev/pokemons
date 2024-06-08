import 'package:flutter/widgets.dart';
import 'package:responsive/src/src.dart';

/// A number extension that provides responsive values
/// based on the current screen size.
extension ResponsiveSize on num {

  /// Returns a responsive value based on the current screen size.
  double responsive(BuildContext context) {
    final scaleFactor = _getScaleFactor(context);
    return this * scaleFactor;
  }

  double _getScaleFactor(BuildContext context) {
    final responsive = ResponsiveConfiguration.of(context);
    final screenShortestSide = MediaQuery.of(context).size.shortestSide;
    final screenType = context.screenType;
    switch (screenType) {
      case ScreenType.small:
        return screenShortestSide / responsive.smallDesignSize.shortestSide;
      case ScreenType.medium:
        return screenShortestSide / responsive.mediumDesignSize.shortestSide;
      case ScreenType.large:
        return screenShortestSide / responsive.largeDesignSize.shortestSide;
    }
  }
}
