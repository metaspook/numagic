import 'dart:ui';

import 'package:flutter/material.dart';

class TranslucentBackground extends StatelessWidget {
  const TranslucentBackground({Key? key, this.child}) : super(key: key);
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
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Align(
            alignment: Alignment.topCenter,
            child: child,
          ),
        ),
      ],
    );
  }
}
