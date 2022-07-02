import 'dart:ui';

import 'package:flutter/material.dart';

class TranslucentBackground extends StatelessWidget {
  const TranslucentBackground({
    Key? key,
    this.blurFilter = const [4, 4],
    this.padding,
    this.child,
  }) : super(key: key);
  final List<double> blurFilter;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/background_home.jpg',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        BackdropFilter(
          filter:
              ImageFilter.blur(sigmaX: blurFilter[0], sigmaY: blurFilter[1]),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: padding ?? const EdgeInsets.all(0),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
