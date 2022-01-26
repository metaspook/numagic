import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/pages/number_table_page.dart';
import 'package:numagic/utils/methods.dart';
import 'package:numagic/widgets/appbar_mod.dart';
import 'package:numagic/widgets/translucent_background.dart';

class AllNumber extends StatefulWidget {
  const AllNumber({Key? key}) : super(key: key);

  @override
  State<AllNumber> createState() => _AllNumberState();
}

class _AllNumberState extends State<AllNumber> {
  final List<int> _numberList =
      List.generate(63, (index) => index, growable: false);
// [for (int i = 0; i < 63; i++) i];

  // @override
  // void initState() {
  //   _numberGrid = _fetchNumbers();
  //   super.initState();
  // }
  Stopwatch _timer = Stopwatch()..start();

  @override
  Widget build(BuildContext context) {
    _numberList.shuffle();
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBarMod(title: 'Food Grid'),
      appBar: AppBarMod(
        title: 'Choose Number',
        routeOnTap: () => NumberTablePage(),
      ),
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
        blurFilter: [2, 2],
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 12,
            ),
            child: GridView.builder(
                // shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemCount: _numberList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.white24),
                    ),
                    //   border: Border.all(
                    //     color: Colors.black,
                    //     width: 1,
                    //   ),
                    // ),
                    // color: Methods.colorPrimariesIndex(index),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "${_numberList[index] + 1}",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Methods.colorPrimariesRandomIndex(index),
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  // Future<List<int>> _fetchNumbers() async {
  //   final Future<List<int>> response = await [for (int i = 0; i < 63; i++) i];

  //   return  response;
  // }
}
