import 'package:flutter/material.dart';
import 'package:numagic/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final longestSide = MediaQuery.of(context).size.longestSide;

    return GestureDetector(
      onTap: () => context.read<HomeController>().setAboutState(),
      child: context.watch<HomeController>().getAboutState
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outlined,
                  color: Colors.white60,
                  size: longestSide * 0.025,
                ),
                SizedBox(width: longestSide * 0.010),
                Text(
                  'About',
                  style: TextStyle(
                      color: Colors.white60, fontSize: longestSide * 0.020),
                ),
              ],
            )
          : Text(
              """
Made with  ❤️  from  🇧🇩
Copyright © 2022, Metaspook""",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white60, fontSize: longestSide * 0.020),
            ),
    );
  }
}
