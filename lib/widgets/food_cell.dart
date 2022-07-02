import 'package:flutter/material.dart';

class FoodCell extends StatelessWidget {
  const FoodCell({
    Key? key,
    this.flex = 0,
    required this.name,
    required this.image,
  }) : super(key: key);

  final int flex;
  final String name, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Flexible(flex: flex, child: Image.asset(image)),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
