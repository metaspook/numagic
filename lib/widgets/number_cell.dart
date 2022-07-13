import 'package:flutter/material.dart';
import 'package:numagic/utils/utils.dart';

class NumberCell extends StatelessWidget {
  const NumberCell(this.number, {Key? key}) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(size.shortestSide * 0.0125),
      padding: EdgeInsets.symmetric(
        vertical: size.shortestSide * 0.0125,
      ),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(size.shortestSide * 0.0125),
      ),
      alignment: Alignment.center,
      child: Text(
        number.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Methods().colorPrimariesRandom(),
          fontSize: size.longestSide * 0.0325,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
