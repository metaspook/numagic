import 'package:flutter/material.dart';
import 'package:numagic/widgets/widgets.dart';

class NumberTable extends StatelessWidget {
  const NumberTable({Key? key, required this.itemTable, required this.itemList})
      : super(key: key);
  final List<List<int>> itemTable;
  final List itemList;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        for (var i = 0; i < itemTable.length; i++)
          TableRow(
            children: <Widget>[
              for (var j = 0; j < itemTable.elementAt(i).length; j++)
                NumberCell(itemList[itemTable.elementAt(i).elementAt(j) - 1])
            ],
          ),
      ],
    );
  }
}
