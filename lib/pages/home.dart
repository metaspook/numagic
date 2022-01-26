import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/pages/food_table_page.dart';
import 'package:numagic/utils/methods.dart';
import 'package:numagic/widgets/all_foods.dart';
import 'package:numagic/widgets/all_number.dart';
import 'package:numagic/widgets/appbar_mod.dart';
import 'package:numagic/widgets/translucent_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<List<Food>> _foodGrid;
  bool _isAbout = true;

  @override
  void initState() {
    _foodGrid = _fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBarMod(title: 'Food Grid'),
      appBar: AppBarMod(title: 'NuMagic 🪄'),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   label: Text("I've Chosen"),
      //   onPressed: () {
      //     setState(() {
      //       // _active = !_active;
      //     });
      //   },
      //   icon: Icon(Icons.done),
      // ),
      body: TranslucentBackground(
        blurFilter: [0, 0],
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
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(bottom: 80),
                  // padding: EdgeInsets.all(_size.height * 0.0125),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
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
                      fontSize: 17.5,
                      fontFamily: 'Consolas',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // SizedBox(height: 20),

                Text(
                  'Grid Type',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white12,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // height: 65,
                      // width: 170,

                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12, width: 10),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: TextButton(
                        onPressed: () =>
                            // () {},
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllNumber()),
                        ),
                        // showCupertinoModalPopup(
                        //     context: context,
                        //     builder: (context) => const FoodTablePage()),
                        child: Text(
                          'Number',
                          // textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white54, fontSize: 40),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      // height: 65,
                      // width: 170,
                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 10),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AllFoods()),
                          );
                        },
                        child: Text(
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
                SizedBox(height: _size.height * 0.3),
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
                          children: [
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
                      : Text(
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

  Future<List<Food>> _fetchFoods() async {
    final String response =
        await rootBundle.loadString('assets/json/food_list.json', cache: true);
    return [for (var i in json.decode(response)) Food.fromMap(i)];
  }
}
