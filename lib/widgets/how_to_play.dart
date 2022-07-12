import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final longestSide = MediaQuery.of(context).size.shortestSide;
    // final orientation = MediaQuery.of(context).orientation;
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
 1. Tell a person to keep secret a Food
    or Number from a grid then Press DONE.
 2. Just ask him/her which tables containing the
    secret Food or Number then check all of those.
 3. Press ✓, I'll show the MAGIC 🪄""",
        style: TextStyle(
          color: Colors.white.withOpacity(.45),
          fontSize: longestSide * 0.04,
          fontFamily: 'Consolas',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
