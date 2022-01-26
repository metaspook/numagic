import 'dart:convert';
import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/pages/home.dart';
import 'package:numagic/utils/constants.dart';
import 'package:numagic/utils/methods.dart';
import 'package:numagic/widgets/appbar_mod.dart';
import 'package:numagic/widgets/custom_divider.dart';
import 'package:numagic/widgets/food_table.dart';
import 'package:numagic/widgets/translucent_background.dart';

class FoodTablePage extends StatefulWidget {
  const FoodTablePage({Key? key}) : super(key: key);

  @override
  _FoodTablePageState createState() => _FoodTablePageState();
}

class _FoodTablePageState extends State<FoodTablePage> {
  final SwiperController _swiperController = SwiperController();
  int _tableIndex = 0;

  final List<Food> _foodList = <Food>[];
  late final List<bool> _checkboxList;
  String? _outImage, _outName;

  @override
  void initState() {
    _swiperController.addListener(_swiperListener);

    _checkboxList = List.generate(
      Constants.foodTableSet.length,
      (index) => false,
      growable: false,
    );
    // _foodGrid = _fetchFoods();
    _fetchFoodList();
    super.initState();
  }

  @override
  void dispose() {
    _swiperController.removeListener(_swiperListener);
    super.dispose();
  }

  void _swiperListener() {
    // if (isShrink != _scrollStatus) setState(() => _scrollStatus = isShrink);
  }

  // bool get isShrink =>
  //   _swiperController.hasClients &&
  //   _swiperController.index > 130 - kToolbarHeight;

  Future<List<Food>> _futureConverter(List<Food> value) async => value;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // toolbarOpacity: 0.9,
        // bottomOpacity: 0.1,
        // actionsIconTheme: const IconThemeData(color: Colors.white60),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Transform.scale(
              scale: 1.5,
              child: Checkbox(
                // activeColor: Colors.orange,
                // shape: CircleBorder(),
                // tristate: false,
                // splashRadius: 30,
                value: _getCheckbox(list: _checkboxList, index: _tableIndex),
                onChanged: (value) => _setCheckbox(
                    list: _checkboxList, index: _tableIndex, value: value!),
              ),
            ),
          ),
        ],
        // automaticallyImplyLeading: false,
        // shadowColor: Colors.black,
        backgroundColor: Colors.black.withOpacity(0.1),
        // backgroundColor: Colors.white.withOpacity(0.1),
        // backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white60),
        centerTitle: true,
        elevation: 10,
        title: Text("Table No. ${_tableIndex + 1}",
            style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white60)),
        // systemOverlayStyle: SystemUiOverlayStyle.light,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              // color: Colors.black.withOpacity(0.1),
              // color: Colors.transparent,
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
                child: const Icon(Icons.done_outline_rounded),
                backgroundColor: Colors.white24,
                onPressed: () => _submitTable(foodList: _foodList),
              ),
              // SizedBox(width: 50),
              FloatingActionButton(
                heroTag: null,
                child: Icon(Icons.refresh),
                backgroundColor: Colors.white24,
                // foregroundColor: Colors.red,
                // focusColor: Colors.red,
                // hoverColor: Colors.red,
                // splashColor: Colors.red,
                onPressed: () {
                  // setState(() {
                  //   _tableIndex = 0;
                  // });
                  _resetTable();
                },
              ),
              // SizedBox(width: 50),
              FloatingActionButton(
                heroTag: null,
                child: const Icon(Icons.home),
                backgroundColor: Colors.white24,
                onPressed: () => Navigator.of(context)
                    .popUntil((Route route) => route.isFirst),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.15),
        ],
      ),
      body: TranslucentBackground(
        blurFilter: [2, 2],
        child: Column(
          children: <Widget>[
            SizedBox(height: kToolbarHeight * 1.25),
            FutureBuilder<List<Food>>(
                future: _futureConverter(_foodList),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Swiper(
                          controller: _swiperController,
                          index: _tableIndex,
                          onIndexChanged: (index) => setState(() {
                            _tableIndex = index;
                          }),
                          control: const SwiperControl(
                              size: 40, color: Colors.white60),
                          pagination: const SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white30,
                                activeColor: Colors.white),
                          ),
                          itemCount: Constants.foodTableSet.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
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
                }),
            // const SizedBox(height: 210),
          ],
        ),
      ),
    );
  }

  void _showDialog([String? title, String? image, String? name]) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black, width: 5),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child:
              AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  // elevation: 15,
                  backgroundColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.75),
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
                      CustomDivider(),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (image != null)
                        Image.asset(
                          image,
                          // fit: BoxFit.scaleDown,
                          // height: 150,
                          // width: 150,
                        ),
                      Text(
                        name!,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
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
              ]
                  // ),
                  );
        });
  }

  Future<void> _fetchFoodList() async {
    final String response =
        await rootBundle.loadString('assets/json/food_list.json');

    _foodList.addAll(
            <Food>[for (var i in json.decode(response)) Food.fromMap(i)])
        // for (Map<String, dynamic> i in json.decode(response)) Food.fromMap(i)
        ;
  }

  void _setCheckbox(
      {required List list, required int index, required bool value}) {
    setState(() => list[index] = value);
  }

  bool _getCheckbox({required List list, required int index}) {
    return list[index];
  }

  void _submitTable({required List foodList}) {
    int sum = 0;
    for (var i = 0; i < Constants.foodTableSet.length; i++) {
      if (_checkboxList[i] == true) {
        sum += Constants.foodTableSet.elementAt(i).elementAt(0).elementAt(5);
      }
    }
    if (sum == 0 || sum > foodList.length) {
      _outImage = null;
      _outName = null;
      _showDialog(
        '⚠️ Secret Food ⚠️',
        null,
        'Invalid table selection.',
      );
    } else {
      _outImage = foodList[sum - 1].image;
      _outName = foodList[sum - 1].name;
      _showDialog(
        '🪄 Secret Food 🪄',
        _outImage!,
        _outName!,
      );
      // setState(() => _showFloatingButton = true);
    }
  }
  // void _scrollBottom() {
  //   if (_swiperController.hasListeners) {
  //     _scrollController.animateTo(_scrollController.position.minScrollExtent,
  //         duration: const Duration(milliseconds: 300),
  //         curve: Curves.elasticOut);
  //   }
  // }

  void _resetTable() {
    // print('RESET');

    setState(() {
      for (var i = 0; i < Constants.foodTableSet.length; i++) {
        _checkboxList[i] = false;
      }
      _swiperController.index = 0;
      _outImage = null;
      _outName = null;
    });
    Navigator.pop(context);
  }
}
