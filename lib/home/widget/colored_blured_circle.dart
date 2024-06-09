import 'dart:ui';

import 'package:flutter/material.dart';

class ColoredBluredCircleWidget extends StatelessWidget {
  const ColoredBluredCircleWidget({
    required this.color,
    required this.size,
    super.key,
  });

  final Color color;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.45),
            blurRadius: size / 2,
            spreadRadius: 45,
          ),
        ],
      ),
    );
  }
}
