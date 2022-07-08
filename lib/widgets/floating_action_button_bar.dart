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
    void resetTable() {
      context.read<TableController>().resetTable();
      context.read<AppBarController>().resetCheckbox();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Builder(builder: (context) {
              final checkboxList =
                  context.watch<AppBarController>().checkboxList;
              return FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.white24,
                onPressed: () async => tableType == TableType.food
                    ? context.read<TableController>().submitFoodTable(
                          context,
                          foodList: await DataService().fetchFoods(),
                          checkboxList: checkboxList,
                        )
                    : context.read<TableController>().submitNumberTable(
                          context,
                          numberList: Methods().numberList,
                          checkboxList: checkboxList,
                        ),
                child: const Icon(Icons.done_outline_rounded),
              );
            }),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.white24,
              onPressed: () {
                resetTable();
                Navigator.pop(context);
              },
              child: const Icon(Icons.refresh),
            ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.white24,
              onPressed: () {
                resetTable();
                Navigator.of(context).popUntil((Route route) => route.isFirst);
              },
              child: const Icon(Icons.home),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.15),
      ],
    );
  }
}
