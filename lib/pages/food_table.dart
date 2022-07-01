import 'dart:convert';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/utils/utils.dart';
import 'package:numagic/widgets/custom_divider.dart';
import 'package:numagic/widgets/food_table.dart';
import 'package:numagic/widgets/translucent_background.dart';

class FoodTablePage extends StatefulWidget {
  const FoodTablePage({Key? key}) : super(key: key);

  @override
  _FoodTablePageState createState() => _FoodTablePageState();
}

class _FoodTablePageState extends State<FoodTablePage> {
  int _tableIndex = 0;

  final List<Food> _foodList = <Food>[];
  late final List<bool> _checkboxList;
  String? _outImage, _outName;

  @override
  void initState() {
    _checkboxList = List.generate(
      Constants.foodTableSet.length,
      (index) => false,
      growable: false,
    );
    _fetchFoodList();
    super.initState();
  }

  Future<List<Food>> _futureConverter(List<Food> value) async => value;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                side: const BorderSide(color: Colors.white60, width: 2),
                activeColor: Colors.white60,
                checkColor: const Color(0xFF2F3857),
                value: _getCheckbox(list: _checkboxList, index: _tableIndex),
                onChanged: (value) async {
                  if (value!) await Music().player.play(Music().audioClick);
                  _setCheckbox(
                    list: _checkboxList,
                    index: _tableIndex,
                    value: value,
                  );
                },
              ),
            ),
          ),
        ],
        backgroundColor: Colors.black.withOpacity(0.1),
        iconTheme: const IconThemeData(color: Colors.white60),
        centerTitle: true,
        elevation: 10,
        title: Text("Table No. ${_tableIndex + 1}",
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white60)),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.white24,
                onPressed: () async {
                  // await Music().player.play(Music().audioClick);
                  _submitTable(foodList: _foodList);
                },
                child: const Icon(Icons.done_outline_rounded),
              ),
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.white24,
                onPressed: () {
                  _resetTable();
                },
                child: const Icon(Icons.refresh),
              ),
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Colors.white24,
                onPressed: () => Navigator.of(context)
                    .popUntil((Route route) => route.isFirst),
                child: const Icon(Icons.home),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.15),
        ],
      ),
      body: TranslucentBackground(
        blurFilter: const [2, 2],
        child: Column(
          children: <Widget>[
            FutureBuilder<List<Food>>(
              future: _futureConverter(_foodList),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 125, bottom: 25),
                      child: Swiper(
                        index: _tableIndex,
                        onIndexChanged: (index) async {
                          setState(() {
                            _tableIndex = index;
                          });
                          await Music().player.play(Music().audioClick);
                        },
                        control: const SwiperControl(
                            padding: EdgeInsets.only(left: 10),
                            size: 40,
                            color: Colors.white60),
                        pagination: const SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.white30, activeColor: Colors.white),
                        ),
                        itemCount: Constants.foodTableSet.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: FoodTableWidget(
                              itemTable:
                                  Constants.foodTableSet.elementAt(index),
                              itemList: snapshot.data!,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog([String? title, String? image, String? name]) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.75),
          title: Column(
            children: [
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const CustomDivider(),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (image != null)
                Image.asset(
                  image,
                ),
              Text(
                name!,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              )
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text('OK', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _fetchFoodList() async {
    final String response =
        await rootBundle.loadString('assets/json/food_list.json');

    _foodList
        .addAll(<Food>[for (var i in json.decode(response)) Food.fromJson(i)]);
  }

  void _setCheckbox(
      {required List list, required int index, required bool value}) {
    setState(() => list[index] = value);
  }

  bool _getCheckbox({required List list, required int index}) {
    return list[index];
  }

  Future<void> _submitTable({required List foodList}) async {
    int sum = 0;
    for (var i = 0; i < Constants.foodTableSet.length; i++) {
      if (_checkboxList[i] == true) {
        sum += Constants.foodTableSet.elementAt(i).elementAt(0).elementAt(5);
      }
    }
    if (sum == 0 || sum > foodList.length) {
      _outImage = null;
      _outName = null;
      await Music().player.play(Music().audioInvalid);
      _showDialog(
        '⚠️ Secret Food ⚠️',
        null,
        'Invalid table selection.',
      );
    } else {
      _outImage = foodList[sum - 1].image;
      _outName = foodList[sum - 1].name;
      await Music().player.play(Music().audioSuccess);
      _showDialog(
        '🪄 Secret Food 🪄',
        _outImage!,
        _outName!,
      );
    }
  }

  void _resetTable() {
    setState(() {
      for (var i = 0; i < Constants.foodTableSet.length; i++) {
        _checkboxList[i] = false;
      }
      _outImage = null;
      _outName = null;
    });
    Navigator.pop(context);
  }
}
