import 'package:flutter/material.dart';
import 'package:numagic/utils/methods.dart';

class NumberTableWidget extends StatelessWidget {
  const NumberTableWidget(
      {Key? key, required this.itemTable, required this.itemList})
      : super(key: key);
  final Iterable<Iterable<int>> itemTable;
  final List itemList;

  @override
  Widget build(BuildContext context) {
    return Table(
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
      ),
      alignment: Alignment.center,
      child: FittedBox(
        child: Text(
          "$name",
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
