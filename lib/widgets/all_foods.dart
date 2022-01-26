import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/pages/food_table_page.dart';
import 'package:numagic/utils/methods.dart';
import 'package:numagic/widgets/appbar_mod.dart';
import 'package:numagic/widgets/translucent_background.dart';

class AllFoods extends StatefulWidget {
  const AllFoods({Key? key}) : super(key: key);

  @override
  State<AllFoods> createState() => _AllFoodsState();
}

class _AllFoodsState extends State<AllFoods> {
  late final Future<List<Food>> _foodGrid;

  @override
  void initState() {
    _foodGrid = _fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: AppBarMod(title: 'Food Grid'),
      appBar: AppBarMod(
        title: 'Choose Food',
        routeOnTap:
            // () {},
            () => FoodTablePage(),
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
            child: FutureBuilder<List<Food>>(
                future: _foodGrid,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    snapshot.data!.shuffle();
                    return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return
                              // Container(
                              // decoration: BoxDecoration(
                              //   color: Colors.black26,
                              //   border: Border.all(color: Colors.white24),
                              // ),
                              //   border: Border.all(
                              //     color: Colors.black,
                              //     width: 1,
                              //   ),
                              // ),
                              // color: Methods.colorPrimariesIndex(index),
                              // alignment: Alignment.center,
                              // child:
                              Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(height: 10),
                              Expanded(
                                  child: Image.asset(
                                snapshot.data![index].image,
                                fit: BoxFit.fill,
                                // alignment: Alignment.center,
                              )),
                              const SizedBox(height: 2.5),
                              Expanded(
                                child: Text(
                                  snapshot.data![index].name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            // ),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                }),
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
