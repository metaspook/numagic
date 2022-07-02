import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 80),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        """
 How To Play:
 ------------
 1. Select grid type and Keep secret
    a Food or Number, Press DONE.
 2. Select all the tables containing
    your secret Food or Number.
 3. Press ✓, I'll show the MAGIC 🪄""",
        style: TextStyle(
          color: Colors.white70,
          fontSize: size.width * 0.04475,
          fontFamily: 'Consolas',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
