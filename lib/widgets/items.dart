import 'package:flutter/material.dart';
import 'package:numagic/utils/methods.dart';

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
    final Color color = Methods.colorPrimariesIndex(index);
    return Padding(
      padding: const EdgeInsets.all(7.5),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 7.5,
            ),
          ],
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () => function(),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(7.5),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       boxShadow: [
    //         BoxShadow(
    //           color: color.withOpacity(0.5),
    //           blurRadius: 10,
    //           spreadRadius: 5,
    //         ),
    //       ],
    //       color: color,
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     width: 50,
    //     height: 30,
    //     // color: color.withOpacity(0.5),
    //     child: MaterialButton(
    //       onPressed: () => function(),
    //       // tileColor: color.withOpacity(0.3),
    //       child: Text(title,
    //           textAlign: TextAlign.center,
    //           style: const TextStyle(fontSize: 25, color: Colors.white)),
    //     ),
    //   ),
    // );
  }
}
