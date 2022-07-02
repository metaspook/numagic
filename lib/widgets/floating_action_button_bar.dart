import 'package:flutter/material.dart';
import 'package:numagic/controllers/controllers.dart';
import 'package:numagic/pages/services/services.dart';
import 'package:provider/provider.dart';

class FloatingActionButtonBar extends StatelessWidget {
  const FloatingActionButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                onPressed: () async =>
                    context.read<FoodTableController>().submitTable(
                          context,
                          foodList: await DataService().fetchFoods(),
                          checkboxList: checkboxList,
                        ),
                child: const Icon(Icons.done_outline_rounded),
              );
            }),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.white24,
              onPressed: () {
                context.read<FoodTableController>().setTableIndex(0);
                context.read<AppBarController>().resetCheckbox(context);
              },
              child: const Icon(Icons.refresh),
            ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.white24,
              onPressed: () => Navigator.of(context)
                  .popUntil((Route route) => route.isFirst),
              child: const Icon(Icons.home),
            ),
          ],
        ),
        SizedBox(height: size.height * 0.15),
      ],
    );
  }
}
