import 'package:flutter/material.dart';

class ColoredBluredCircleWidget extends StatelessWidget {
  const ColoredBluredCircleWidget({
    required this.color,
    required this.size,
    this.blurRadius,
    this.spreadRadius,
    super.key,
  });

  final Color color;

  final double size;

  final double? blurRadius;

  final double? spreadRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: blurRadius ?? size / 2,
            spreadRadius: spreadRadius ?? 45,
          ),
        ],
      ),
    );
  }
}
