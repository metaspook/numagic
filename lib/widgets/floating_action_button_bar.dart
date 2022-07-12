import 'package:flutter/material.dart';
import 'package:numagic/controllers/controllers.dart';
import 'package:numagic/pages/services/services.dart';
import 'package:numagic/utils/utils.dart';
import 'package:provider/provider.dart';

class FloatingActionButtonBar extends StatelessWidget {
  const FloatingActionButtonBar(this.tableType, {Key? key}) : super(key: key);
  final TableType tableType;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final tableController = context.read<TableController>();
    final checkboxList = context.watch<AppBarController>().checkboxList;
    void resetTable() {
      tableController.resetTable(tableType);
      context.read<AppBarController>().resetCheckbox();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.white24,
              onPressed: () {
                resetTable();
                Navigator.of(context).popUntil((Route route) => route.isFirst);
              },
              child: const Icon(Icons.home),
            ),
            if (checkboxList.contains(true))
              FloatingActionButton.extended(
                label: const Text('🪄', style: TextStyle(fontSize: 35)),
                heroTag: null,
                backgroundColor: Colors.white12,
                onPressed: () async {
                  switch (tableType) {
                    case TableType.food:
                      return tableController.submitFoodTable(
                        context,
                        foodList: await DataService().fetchFoods(),
                        checkboxList: checkboxList,
                      );
                    case TableType.number:
                      return tableController.submitNumberTable(
                        context,
                        numberList: Methods().numberList,
                        checkboxList: checkboxList,
                      );
                  }
                },
              ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.white24,
              onPressed: () {
                resetTable();
                Navigator.pop(context);
              },
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.15),
      ],
    );
  }
}
