import 'package:flutter/material.dart';
import 'package:numagic/pages/food_grid.dart';
import 'package:numagic/pages/number_grid.dart';
import 'package:numagic/widgets/appbar_mod.dart';
import 'package:numagic/widgets/translucent_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAbout = true;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

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
              children: [
                Container(
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
                      fontSize: _size.width * 0.04475,
                      fontFamily: 'Consolas',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Grid Type',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white12,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 10),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NumberGridPage()),
                        ),
                        child: const Text(
                          'Number',
                          style: TextStyle(color: Colors.white54, fontSize: 40),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 10),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodGridPage()),
                          );
                        },
                        child: const Text(
                          'Food',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 125),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAbout = !_isAbout;
                    });
                  },
                  child: _isAbout
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
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 20),
                            ),
                          ],
                        )
                      : const Text(
                          """
Made with  ❤️  from  🇧🇩
Copyright © 2022, Metaspook""",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
