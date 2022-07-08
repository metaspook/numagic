import 'package:flutter/material.dart';
import 'package:numagic/utils/utils.dart';

class NumberCell extends StatelessWidget {
  const NumberCell({Key? key, required this.number}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
          number.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Methods().colorPrimariesRandom(),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
