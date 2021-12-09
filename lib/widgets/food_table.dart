import 'dart:math';
import 'package:flutter/material.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/widgets/custom_divider.dart';

class FoodTable extends StatelessWidget {
  FoodTable({Key? key, required this.itemTable, required this.itemList})
      : super(key: key);
  final List<List<int>> itemTable;
  final List<Food> itemList;

  Future<List<Food>> _futureFoodList() async => itemList;
  Padding _foodTableCell({required String name, required String image}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            // fit: BoxFit.cover,
          ),
          Text(
            name,
            style: const TextStyle(
              // color: Colors.black,
              color: Colors.white60,
              fontWeight: FontWeight.bold,
              // fontFamily: 'Consolas',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: _futureFoodList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Table(
              // defaultColumnWidth: FixedColumnWidth(size.width * 0.15),
              border: TableBorder.all(
                // color: Colors.black,
                color: Colors.white38,
                style: BorderStyle.solid,
                width: 2,
              ),
              children: <TableRow>[
                for (var i = 0; i < itemTable.length; i++)
                  TableRow(children: <Widget>[
                    for (var j = 0; j < itemTable[i].length; j++)
                      _foodTableCell(
                        image: snapshot.data![itemTable[i][j] - 1].image,
                        name: snapshot.data![itemTable[i][j] - 1].name,
                      )
                  ]),
              ]);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
