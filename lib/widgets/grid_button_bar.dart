import 'package:flutter/material.dart';
import 'package:numagic/controllers/home_controller.dart';
import 'package:numagic/pages/pages.dart';
import 'package:provider/provider.dart';

class GridButtonBar extends StatelessWidget {
  const GridButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gridPageRoute = context.read<HomeController>().gridPageRoute;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Text(
          'Grid Type',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white12,
            fontSize: size.shortestSide * 0.125,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black12, width: size.shortestSide * 0.0225),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: TextButton(
                onPressed: () => gridPageRoute(context, const NumberGridPage()),
                child: Text(
                  'Number',
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: size.shortestSide * 0.075),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.135),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black12, width: size.shortestSide * 0.0225),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: TextButton(
                onPressed: () => gridPageRoute(context, const FoodGridPage()),
                child: Text(
                  'Food',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: size.shortestSide * 0.075,
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
