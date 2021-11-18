import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final int index;
  final String title;
  final Function function;

  const ItemWidget(
      {Key? key,
      required this.index,
      required this.title,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[index % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 50,
        height: 30,
        // color: color.withOpacity(0.5),
        child: MaterialButton(
          onPressed: () => function(),
          // tileColor: color.withOpacity(0.3),
          child: Text(title,
              style: const TextStyle(fontSize: 15, color: Colors.white)),
        ),
      ),
    );
  }
}
