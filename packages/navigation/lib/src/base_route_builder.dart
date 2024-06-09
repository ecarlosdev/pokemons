import 'package:flutter/material.dart';

/// Base class for route builders.
abstract class BaseRouteBuilder<T> {
  /// Creates a route builder.
  BaseRouteBuilder({
    required this.context,
    bool rootNavigator = false,
  }) : _rootNavigator = rootNavigator;

  /// The build context.
  @protected
  final BuildContext context;

  final bool _rootNavigator;

  /// Gets the route.
  Route<T> getRoute();

  /// Pushes the route.
  Future<void> push() async {
    await Navigator.of(
      context,
      rootNavigator: _rootNavigator,
    ).push(getRoute());
  }

  /// Pushes the route and removes all routes.
  Future<void> pushAndRemoveAll() async {
    await Navigator.of(
      context,
      rootNavigator: _rootNavigator,
    ).pushAndRemoveUntil(getRoute(), (route) => false);
  }

  /// Pushes the route and removes all routes until the named route.
  Future<void> pushAndRemoveUntilNamed(String name) async {
    await Navigator.of(
      context,
      rootNavigator: _rootNavigator,
    ).pushAndRemoveUntil(getRoute(), (route) => route.settings.name == name);
  }

  /// Pushes the route and removes the previous route.
  Future<void> pushReplacement() async {
    await Navigator.of(
      context,
      rootNavigator: _rootNavigator,
    ).pushReplacement(getRoute());
  }

  /// Pushes the route and removes the previous route until the named route.
  Future<void> pushAndRemoveUntilFirst() async {
    await Navigator.of(
      context,
      rootNavigator: _rootNavigator,
    ).pushAndRemoveUntil(getRoute(), (route) => route.isFirst);
  }
}
