import 'dart:math';

import 'package:flutter/material.dart';
import 'package:numagic/utils/constants.dart';
import 'package:numagic/widgets/widgets.dart';

class Methods {
  Methods._();
  factory Methods() => Methods._();

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

  void showDialogMod(BuildContext context,
      {String? title, String? image, String? name}) {
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
                title!,
                style: const TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const CustomDivider(),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (image != null) Image.asset(image),
              if (name != null)
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ],
          ),
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
