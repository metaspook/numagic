import 'package:flutter/material.dart';
import 'package:numagic/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarMod(title: 'NuMagic 🪄'),
      body: TranslucentBackground(
        blurFilter: const [0, 0],
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 12,
            ),
            child: ListView(
              children: const [
                HowToPlay(),
                GridButtonBar(),
                SizedBox(height: 125),
                AboutButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
