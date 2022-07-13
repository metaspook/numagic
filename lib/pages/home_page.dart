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
    final size = MediaQuery.of(context).size;
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight * 1.5),
                  const HowToPlay(),
                  const GridButtonBar(),
                  SizedBox(
                    height: size.shortestSide *
                        (size.height == size.shortestSide ? 0.065 : 0.45),
                  ),
                  const AboutButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
