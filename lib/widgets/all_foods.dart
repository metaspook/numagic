import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/utils/methods.dart';
import 'package:numagic/widgets/appbar.dart';
import 'package:numagic/widgets/translucent_background.dart';

class AllFoods extends StatefulWidget {
  const AllFoods({Key? key}) : super(key: key);

  @override
  State<AllFoods> createState() => _AllFoodsState();
}

class _AllFoodsState extends State<AllFoods> {
  late Future<List<Food>> _foodGrid;

  @override
  void initState() {
    _foodGrid = _fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(title: 'Food Grid'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("I've Chosen"),
        onPressed: () {
          setState(() {
            // _active = !_active;
          });
        },
        icon: Icon(Icons.done),
      ),
      body: TranslucentBackground(
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 7,
              right: 7,
              top: 14,
              bottom: 70,
            ),
            child: FutureBuilder<List<Food>>(
                future: _foodGrid,
                builder: (context, snapshot) {
                  snapshot.data!.shuffle();
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70)),
                          //   border: Border.all(
                          //     color: Colors.black,
                          //     width: 1,
                          //   ),
                          // ),
                          // color: Methods.colorPrimariesIndex(index),
                          // alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 4),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // const SizedBox(height: 10),
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
        ),
      ),
    );
  }

  Future<List<Food>> _fetchFoods() async {
    final String response =
        await rootBundle.loadString('assets/json/food_list.json');
    return [for (var i in json.decode(response)) Food.fromMap(i)];
  }
}
