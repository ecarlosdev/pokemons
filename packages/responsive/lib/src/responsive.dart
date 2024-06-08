import 'package:flutter/widgets.dart';

/// An [InheritedWidget] that provides responsive configuation.
class ResponsiveConfiguration extends InheritedWidget {
  /// Creates a new [ResponsiveConfiguration] widget.
  const ResponsiveConfiguration({
    required this.smallDesignSize,
    required this.mediumDesignSize,
    required this.largeDesignSize,
    required super.child,
    super.key,
  });

  /// The design size for mobile devices.
  final Size smallDesignSize;

  /// The design size for tablet devices.
  final Size mediumDesignSize;

  /// The design size for desktop devices.
  final Size largeDesignSize;

  /// Returns the [ResponsiveConfiguration] of the closest [BuildContext].
  static ResponsiveConfiguration of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResponsiveConfiguration>()!;
  }

  @override
  bool updateShouldNotify(ResponsiveConfiguration oldWidget) {
    return smallDesignSize != oldWidget.smallDesignSize ||
        mediumDesignSize != oldWidget.mediumDesignSize ||
        largeDesignSize != oldWidget.largeDesignSize;
  }
}
