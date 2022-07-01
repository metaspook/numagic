import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/pages/food_table.dart';
import 'package:numagic/widgets/appbar_mod.dart';
import 'package:numagic/widgets/translucent_background.dart';

class FoodGridPage extends StatefulWidget {
  const FoodGridPage({Key? key}) : super(key: key);

  @override
  State<FoodGridPage> createState() => _FoodGridPageState();
}

class _FoodGridPageState extends State<FoodGridPage> {
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
      appBar: AppBarMod(
        title: 'Choose Food',
        routeOnTap: () => const FoodTablePage(),
      ),
      body: TranslucentBackground(
        blurFilter: const [2, 2],
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
                          return Column(
                            children: [
                              const SizedBox(height: 10),
                              Expanded(
                                  child: Image.asset(
                                snapshot.data![index].image,
                                fit: BoxFit.fill,
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
    return [for (var i in json.decode(response)) Food.fromJson(i)];
  }
}
