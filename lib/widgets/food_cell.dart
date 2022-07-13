import 'package:flutter/material.dart';

class FoodCell extends StatelessWidget {
  const FoodCell({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  final String name, image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          LimitedBox(
            maxHeight: size.longestSide * 0.0575,
            maxWidth: size.longestSide * 0.0575,
            child: Image.asset(image),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w700,
              fontSize: size.longestSide * 0.01425,
            ),
          ),
        ],
      ),
    );
  }
}
