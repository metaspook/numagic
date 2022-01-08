import 'dart:math';
import 'package:flutter/material.dart';
import 'package:numagic/utils/constants.dart';

class Methods {
  static MaterialColor colorRandom() =>
      Constants.colors[Random().nextInt(Constants.colors.length)];

  static MaterialColor colorPrimariesRandom() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  // Useful when use with a builder.
  static MaterialColor colorPrimariesIndex(int index) =>
      Colors.primaries[index % Colors.primaries.length];

  static MaterialColor colorPrimariesRandomIndex(int index) {
    var primaries = [...Colors.primaries];
    primaries.shuffle();
    return primaries[index % primaries.length];
  }
}
