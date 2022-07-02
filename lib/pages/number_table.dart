import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:numagic/utils/utils.dart';
import 'package:numagic/widgets/custom_divider.dart';
import 'package:numagic/widgets/number_table.dart';
import 'package:numagic/widgets/translucent_background.dart';

class NumberTablePage extends StatefulWidget {
  const NumberTablePage({Key? key}) : super(key: key);

  @override
  _NumberTablePageState createState() => _NumberTablePageState();
}

class _NumberTablePageState extends State<NumberTablePage> {
  int _tableIndex = 0;
  final List<int> _numberList =
      List<int>.generate(63, (index) => index + 1, growable: false);
  late final List<bool> _checkboxList;
  String? _outNumber;

  @override
  void initState() {
    super.initState();
    _checkboxList = List.generate(
      Constants().numberTableSet.length,
      (index) => false,
      growable: false,
    );
  }

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
                value: _getCheckbox(list: _checkboxList, index: _tableIndex),
                onChanged: (value) => _setCheckbox(
                    list: _checkboxList, index: _tableIndex, value: value!),
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
                onPressed: () => _submitTable(foodList: _numberList),
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
            const SizedBox(height: kToolbarHeight * 1.25),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Swiper(
                  index: _tableIndex,
                  onIndexChanged: (index) => setState(() {
                    _tableIndex = index;
                  }),
                  control: const SwiperControl(
                      padding: EdgeInsets.only(left: 10),
                      size: 40,
                      color: Colors.white60),
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white30, activeColor: Colors.white),
                  ),
                  itemCount: Constants().numberTableSet.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 50),
                      child: NumberTableWidget(
                        itemTable: Constants().numberTableSet.elementAt(index),
                        itemList: _numberList,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog({required String title, required String number}) {
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
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const CustomDivider(),
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
          ],
        );
      },
    );
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
    for (var i = 0; i < Constants().numberTableSet.length; i++) {
      if (_checkboxList[i] == true) {
        sum +=
            Constants().numberTableSet.elementAt(i).elementAt(0).elementAt(0);
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
    }
  }

  void _resetTable() {
    setState(() {
      for (var i = 0; i < Constants().foodTableSet.length; i++) {
        _checkboxList[i] = false;
      }
      _outNumber = null;
    });
    Navigator.pop(context);
  }
}
