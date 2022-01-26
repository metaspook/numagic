import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/utils/constants.dart';
import 'package:numagic/widgets/custom_divider.dart';
import 'package:numagic/widgets/number_table.dart';
import 'package:numagic/widgets/translucent_background.dart';

class NumberTablePage extends StatefulWidget {
  const NumberTablePage({Key? key}) : super(key: key);

  @override
  _NumberTablePageState createState() => _NumberTablePageState();
}

class _NumberTablePageState extends State<NumberTablePage> {
  final SwiperController _swiperController = SwiperController();
  int _tableIndex = 0;

  // final List<Food> _foodList = <Food>[];
  final List<int> _numberList =
      List<int>.generate(63, (index) => index + 1, growable: false);
  late final List<bool> _checkboxList;
  String? _outNumber;

  @override
  void initState() {
    super.initState();
    _swiperController.addListener(_swiperListener);

    _checkboxList = List.generate(
      Constants.numberTableSet.length,
      (index) => false,
      growable: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _swiperController.removeListener(_swiperListener);
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
    print(_numberList);
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
                onPressed: () => _submitTable(foodList: _numberList),
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Swiper(
                  controller: _swiperController,
                  index: _tableIndex,
                  onIndexChanged: (index) => setState(() {
                    _tableIndex = index;
                  }),
                  control: const SwiperControl(size: 40, color: Colors.white60),
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white30, activeColor: Colors.white),
                  ),
                  itemCount: Constants.numberTableSet.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: NumberTableWidget(
                        itemTable: Constants.numberTableSet.elementAt(index),
                        itemList: _numberList,
                      ),
                    );
                  },
                ),
              ),
            ),
            // const SizedBox(height: 210),
          ],
        ),
      ),
    );
  }

  void _showDialog({required String title, required String number}) {
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
                        title,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      CustomDivider(),
                    ],
                  ),
                  content: Text(
                    number,
                    textAlign: TextAlign.center,
                    style: _outNumber == null
                        ? Theme.of(context).textTheme.headline4
                        : Theme.of(context).textTheme.headline1,
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

  void _setCheckbox(
      {required List list, required int index, required bool value}) {
    setState(() => list[index] = value);
  }

  bool _getCheckbox({required List list, required int index}) {
    return list[index];
  }

  void _submitTable({required List foodList}) {
    int sum = 0;
    for (var i = 0; i < Constants.numberTableSet.length; i++) {
      if (_checkboxList[i] == true) {
        sum += Constants.numberTableSet.elementAt(i).elementAt(0).elementAt(0);
      }
    }
    if (sum == 0 || sum > _numberList.length) {
      _outNumber = null;
      _showDialog(
        title: '⚠️  Secret Number ⚠️',
        number: 'Invalid table selection.',
      );
    } else {
      _outNumber = _numberList[sum - 1].toString();
      _showDialog(
        title: '🪄 Secret Number 🪄',
        number: _outNumber!,
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
      _outNumber = null;
    });
    Navigator.pop(context);
  }
}
