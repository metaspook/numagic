import 'package:flutter/material.dart';
import 'package:numagic/controllers/home_controller.dart';
import 'package:numagic/utils/utils.dart';
import 'package:provider/provider.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final longestSide = MediaQuery.of(context).size.longestSide;
    final homeController = context.read<HomeController>();
    final TextStyle primaryTextStyle = TextStyle(
      color: Colors.white60,
      fontSize: longestSide * 0.0225,
      fontWeight: FontWeight.w500,
    );
    return GestureDetector(
      onTap: () => homeController.setAboutState(),
      child: context.watch<HomeController>().getAboutState
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      color: Colors.white60, fontSize: longestSide * 0.025),
                ),
              ],
            )
          : Column(
              children: [
                Text(
                  "${Constants().appVersion} 👨‍💻 Made with 🧠 & ❤️",
                  textAlign: TextAlign.center,
                  style: primaryTextStyle,
                ),
                Text(
                  "\"Not that simple as it seems, it's a Magic\nof math and programming.\"",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: longestSide * 0.02,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Copyright © ${homeController.currentYearLine}, Metaspook",
                  textAlign: TextAlign.center,
                  style: primaryTextStyle,
                ),
              ],
            ),
    );
  }
}
