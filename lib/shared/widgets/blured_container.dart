import 'dart:ui';

import 'package:flutter/material.dart';

class BluredContainerWidget extends StatelessWidget {
  const BluredContainerWidget({
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.borderRadius,
    this.child,
    super.key,
  });

  final BorderRadiusGeometry? borderRadius;

  final EdgeInsets? margin;

  final EdgeInsets? padding;

  final double? height;

  final double? width;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              padding: padding,
              margin: margin,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.white.withOpacity(0.1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
