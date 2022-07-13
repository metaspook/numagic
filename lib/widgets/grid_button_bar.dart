import 'package:flutter/material.dart';
import 'package:numagic/pages/pages.dart';
import 'package:numagic/utils/utils.dart';

class GridButtonBar extends StatelessWidget {
  const GridButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          'Grid Type',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white12,
            fontSize: size.shortestSide *
                (size.width == size.shortestSide ? 0.2 : 0.125),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GridButton(
              title: 'Number',
              page: NumberGridPage(),
            ),
            SizedBox(width: size.width * 0.075),
            const GridButton(
              title: 'Food',
              page: FoodGridPage(),
            ),
          ],
        ),
      ],
    );
  }
}

class GridButton extends StatelessWidget {
  const GridButton({
    Key? key,
    required this.title,
    required this.page,
  }) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black12,
            width: size.shortestSide *
                (size.width == size.shortestSide ? 0.03 : 0.025)),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: TextButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
          await Music().player.play(Music().audioClick);
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white54,
            fontSize: size.shortestSide *
                (size.width == size.shortestSide ? 0.1 : 0.075),
          ),
        ),
      ),
    );
  }
}
