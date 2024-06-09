import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

class BluredContainerWidget extends StatelessWidget {
  const BluredContainerWidget({
    this.height,
    this.width,
    this.margin,
    this.borderRadius,
    this.child,
    super.key,
  });

  final BorderRadiusGeometry? borderRadius;

  final EdgeInsets? margin;

  final double? height;

  final double? width;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
              padding: EdgeInsets.all(20.responsive(context)),
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
