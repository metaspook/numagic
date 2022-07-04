import 'dart:math';

import 'package:flutter/material.dart';
import 'package:numagic/utils/constants.dart';
import 'package:numagic/widgets/widgets.dart';

class Methods {
  Methods._();
  factory Methods() => Methods._();

  final List<int> _numberList =
      List<int>.generate(63, (index) => index + 1, growable: false);
  List<int> get numberList => _numberList;

  MaterialColor colorRandom() =>
      Constants().colors[Random().nextInt(Constants().colors.length)];

  MaterialColor colorPrimariesRandom() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  // Useful when use with a builder.
  MaterialColor colorPrimariesIndex(int index) =>
      Colors.primaries[index % Colors.primaries.length];

  MaterialColor colorPrimariesRandomIndex(int index) {
    var primaries = [...Colors.primaries];
    primaries.shuffle();
    return primaries[index % primaries.length];
  }

  void dialogInvalidTable(
    BuildContext context, {
    required String title,
    required String msg,
  }) {
    final content = Text(
      msg,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
    _showDialogMod(context, title: title, content: content);
  }

  void dialogFoodTable(
    BuildContext context, {
    required String title,
    String? image,
    required String name,
  }) {
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (image != null) Image.asset(image),
        Text(
          name,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
    _showDialogMod(context, title: title, content: content);
  }

  void dialogNumberTable(
    BuildContext context, {
    required String title,
    required String number,
  }) {
    final content = Text(
      number,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
    _showDialogMod(context, title: title, content: content);
  }

  void _showDialogMod(BuildContext context,
      {String title = '', Widget? content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.75),
          title: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const CustomDivider(),
            ],
          ),
          content: content,
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('OK', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        );
      },
    );
  }
}
