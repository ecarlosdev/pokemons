import 'package:flutter/material.dart';

class ThemeTextExtension extends ThemeExtension<ThemeTextExtension> {
  const ThemeTextExtension({
    required this.headLine,
    required this.pageTitle,
    required this.tabBarLabel,
    required this.body,
    required this.chips,
    required this.field,
  });

  final TextStyle headLine;

  final TextStyle pageTitle;

  final TextStyle tabBarLabel;

  final TextStyle body;

  final TextStyle chips;

  final TextStyle field;

  @override
  ThemeExtension<ThemeTextExtension> copyWith({
    TextStyle? headLine,
    TextStyle? pageTitle,
    TextStyle? tabBarLabel,
    TextStyle? body,
    TextStyle? chips,
    TextStyle? field,
  }) {
    return ThemeTextExtension(
      headLine: headLine ?? this.headLine,
      pageTitle: pageTitle ?? this.pageTitle,
      tabBarLabel: tabBarLabel ?? this.tabBarLabel,
      body: body ?? this.body,
      chips: chips ?? this.chips,
      field: field ?? this.field,
    );
  }

  @override
  ThemeExtension<ThemeTextExtension> lerp(
    covariant ThemeExtension<ThemeTextExtension>? other,
    double t,
  ) {
    if (other is! ThemeTextExtension) {
      return this;
    }

    return ThemeTextExtension(
      headLine: TextStyle.lerp(headLine, other.headLine, t)!,
      pageTitle: TextStyle.lerp(pageTitle, other.pageTitle, t)!,
      tabBarLabel: TextStyle.lerp(tabBarLabel, other.tabBarLabel, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      chips: TextStyle.lerp(chips, other.chips, t)!,
      field: TextStyle.lerp(field, other.field, t)!,
    );
  }
}
