import 'package:flutter/material.dart';
import 'package:numagic/models/models.dart';
import 'package:numagic/widgets/widgets.dart';

class FoodTable extends StatelessWidget {
  const FoodTable(
      {Key? key, required this.itemTable, required this.itemList, this.padding})
      : super(key: key);
  final List<List<int>> itemTable;
  final List<Food> itemList;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Table(
        children: <TableRow>[
          for (var i = 0; i < itemTable.length; i++)
            TableRow(
              children: <Widget>[
                for (var j = 0; j < itemTable.elementAt(i).length; j++)
                  FoodCell(
                    name:
                        itemList[itemTable.elementAt(i).elementAt(j) - 1].name,
                    image:
                        itemList[itemTable.elementAt(i).elementAt(j) - 1].image,
                  )
              ],
            ),
        ],
      ),
    );
  }
}
