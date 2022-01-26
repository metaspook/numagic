import 'dart:math';
import 'package:flutter/material.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/utils/methods.dart';
import 'package:numagic/widgets/custom_divider.dart';

class NumberTableWidget extends StatelessWidget {
  const NumberTableWidget(
      {Key? key, required this.itemTable, required this.itemList})
      : super(key: key);
  final Iterable<Iterable<int>> itemTable;
  final List itemList;

  @override
  Widget build(BuildContext context) {
    return Table(
      // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
      // defaultColumnWidth: FixedColumnWidth(size.width * 0.15),
      // border: TableBorder.all(
      //   // color: Colors.black,
      //   color: Colors.white38,
      //   // style: BorderStyle.solid,
      //   width: 2,
      // ),
      children: [
        for (var i = 0; i < itemTable.length; i++)
          TableRow(
            children: <Widget>[
              for (var j = 0; j < itemTable.elementAt(i).length; j++)
                _numberTableCell(
                  name: itemList[itemTable.elementAt(i).elementAt(j) - 1],
                )
            ],
          ),
      ],
    );
  }

  _numberTableCell({required int name}) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(4),

      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: Colors.white24),
      ),
      //   border: Border.all(
      //     color: Colors.black,
      //     width: 1,
      //   ),
      // ),
      // color: Methods.colorPrimariesIndex(index),
      alignment: Alignment.center,
      child: FittedBox(
        // fit: BoxFit.cover,
        child: Text(
          "$name",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Methods.colorPrimariesRandom(),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
