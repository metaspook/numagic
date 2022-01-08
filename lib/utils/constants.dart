import 'package:flutter/material.dart';

class Constants {
  static const List<MaterialColor> colors = <MaterialColor>[
    // Activated 15 10 9 8 7 6 5 1 0 looks better.
    Colors.red,
    Colors.pink,
    // Colors.purple,
    // Colors.deepPurple,
    // Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    // Colors.lime,
    // Colors.yellow,
    // Colors.amber,
    // Colors.orange,
    Colors.deepOrange,
    // Colors.brown,
    // Colors.blueGrey
  ];

  static const List<List<List<int>>> foodTables = [
    [
      [3, 5, 7, 9, 11, 1],
      [13, 15, 17, 19, 21, 23],
      [25, 27, 29, 31, 33, 35],
      [37, 39, 41, 43, 45, 47],
      [49, 51, 53, 55, 57, 59]
    ],
    [
      [5, 6, 7, 13, 12, 4],
      [14, 15, 20, 21, 22, 23],
      [28, 29, 30, 31, 36, 37],
      [38, 39, 44, 45, 46, 47],
      [52, 53, 54, 55, 60, 13]
    ],
    [
      [9, 10, 11, 12, 13, 8],
      [14, 15, 24, 25, 26, 27],
      [28, 29, 30, 31, 40, 41],
      [42, 43, 44, 45, 46, 47],
      [56, 57, 58, 59, 60, 13]
    ],
    [
      [3, 6, 7, 10, 11, 2],
      [14, 15, 18, 19, 22, 23],
      [26, 27, 30, 31, 34, 35],
      [38, 39, 42, 43, 46, 47],
      [50, 51, 54, 55, 58, 59]
    ],
    [
      [17, 18, 19, 20, 21, 16],
      [22, 23, 24, 25, 26, 27],
      [28, 29, 30, 31, 48, 49],
      [50, 51, 52, 53, 54, 55],
      [56, 57, 58, 59, 60, 31]
    ],
    [
      [33, 34, 35, 36, 37, 32],
      [38, 39, 40, 41, 42, 43],
      [44, 45, 46, 55, 48, 49],
      [50, 51, 52, 53, 54, 47],
      [56, 57, 58, 59, 60, 46]
    ]
  ];
}