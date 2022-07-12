import 'package:flutter/material.dart';
import 'package:numagic/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<HomeController>().setAboutState(),
      child: context.watch<HomeController>().getAboutState
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.info_outlined,
                  color: Colors.white60,
                ),
                SizedBox(width: 10),
                Text(
                  'About',
                  style: TextStyle(color: Colors.white60, fontSize: 20),
                ),
              ],
            )
          : const Text(
              """
Made with  ❤️  from  🇧🇩
Copyright © 2022, Metaspook""",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60, fontSize: 20),
            ),
    );
  }
}
