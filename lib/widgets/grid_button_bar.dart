import 'package:flutter/material.dart';
import 'package:numagic/controllers/home_controller.dart';
import 'package:numagic/pages/pages.dart';
import 'package:provider/provider.dart';

class GridButtonBar extends StatelessWidget {
  const GridButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gridPageRoute = context.read<HomeController>().gridPageRoute;
    return Column(
      children: [
        const Text(
          'Grid Type',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white12,
            fontSize: 80,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 10),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: TextButton(
                onPressed: () => gridPageRoute(context, const NumberGridPage()),
                child: const Text(
                  'Number',
                  style: TextStyle(color: Colors.white54, fontSize: 40),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 10),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: TextButton(
                onPressed: () => gridPageRoute(context, const FoodGridPage()),
                child: const Text(
                  'Food',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
