import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final orientation = MediaQuery.of(context).orientation;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.longestSide * 0.0175, vertical: 15),
      margin: EdgeInsets.only(bottom: size.height * 0.01),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(size.longestSide * 0.015),
      ),
      child: Text(
        """
How To Play:
------------
1.Tell a person to keep secret a Food
  or Number from a grid then Press DONE.
2.Just ask him/her which tables contain
  the secret Food or Number then check
  all of those.
3.Press 🪄 button to reveal the secret.""",
        // textScaleFactor: longestSide * 0.00285,
        style: TextStyle(
          color: Colors.white.withOpacity(.45),
          fontSize: size.longestSide * 0.019,
          fontFamily: 'Consolas',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
