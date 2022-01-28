import 'package:flutter/material.dart';

class FoodTableWidget extends StatelessWidget {
  const FoodTableWidget(
      {Key? key, required this.itemTable, required this.itemList})
      : super(key: key);
  final Iterable<Iterable<int>> itemTable;
  final List itemList;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: <TableRow>[
        for (var i = 0; i < itemTable.length; i++)
          TableRow(
            children: <Widget>[
              for (var j = 0; j < itemTable.elementAt(i).length; j++)
                _foodTableCell(
                  image:
                      itemList[itemTable.elementAt(i).elementAt(j) - 1].image,
                  name: itemList[itemTable.elementAt(i).elementAt(j) - 1].name,
                )
            ],
          ),
      ],
    );
  }

  Padding _foodTableCell({required String name, required String image}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
