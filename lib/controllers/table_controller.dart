import 'dart:math';

import 'package:flutter/material.dart';
import 'package:numagic/models/models.dart';
import 'package:numagic/utils/utils.dart';

enum TableType { food, number }

class TableController extends ChangeNotifier {
  // Table index related.
  static int _tableIndex = 0;
  int get tableIndex => _tableIndex;
  Future<void> setTableIndex(int index) async {
    await Music().player.play(Music().audioClick);
    _tableIndex = index;
    notifyListeners();
  }

  // Tables randomization.
  static bool _isReverseColumn = Random().nextBool();
  static bool _isReverseRow = Random().nextBool();
  static List<List<List<int>>> get _randomizeFoodTables {
    List<List<List<int>>> randomFoodTables = Constants().foodTables..shuffle();
    if (_isReverseColumn) {
      randomFoodTables = [
        ...randomFoodTables
            .map<List<List<int>>>((column) => [...column.reversed])
      ];
    }
    if (_isReverseRow) {
      randomFoodTables = [
        ...randomFoodTables.map<List<List<int>>>((column) => [
              ...column.map<List<int>>((row) => [...row.reversed])
            ])
      ];
    }
    return randomFoodTables;
  }

  List<List<List<int>>> _foodTables = _randomizeFoodTables;
  List<List<List<int>>> get foodTables => _foodTables;

  void resetTable() {
    _isReverseRow = Random().nextBool();
    _isReverseColumn = Random().nextBool();
    _foodTables = _randomizeFoodTables;
    setTableIndex(0);
  }

  // Tables column randomization.

  // final List<Set<int>> _reversedFoodColumn = [
  //   ...Constants().foodTables[_tableIndex].reversed
  // ];
  // List<List<Set<int>>> get foodTables => _foodTables;
  // void reRandomizeFoodTables() => _foodTables = _randomizeFoodTables;

  // Table submission.
  Future<void> submitFoodTable(
    BuildContext context, {
    required List<Food> foodList,
    required List<bool> checkboxList,
  }) async {
    int sum = 0;
    for (int i = 0; i < checkboxList.length; i++) {
      if (checkboxList[i] == true) {
        sum += _foodTables
            .elementAt(i)
            .elementAt(_isReverseColumn ? 4 : 0)
            .elementAt(_isReverseRow ? 0 : 5);
      }
    }
    if (sum == 0 || sum > foodList.length) {
      Methods().dialogInvalidTable(
        context,
        title: '⚠️ Secret Food ⚠️',
        msg: 'Invalid table selection.',
      );
      await Music().player.play(Music().audioInvalid);
    } else {
      Methods().dialogFoodTable(
        context,
        title: '🪄 Secret Food 🪄',
        image: foodList[sum - 1].image,
        name: foodList[sum - 1].name,
      );
      await Music().player.play(Music().audioSuccess);
    }
  }

  Future<void> submitNumberTable(
    BuildContext context, {
    required List<int> numberList,
    required List<bool> checkboxList,
  }) async {
    int sum = 0;
    for (int i = 0; i < checkboxList.length; i++) {
      if (checkboxList[i] == true) {
        sum += Constants().foodTables.elementAt(i).elementAt(0).elementAt(0);
      }
    }
    if (sum == 0 || sum > numberList.length) {
      Methods().dialogInvalidTable(
        context,
        title: '⚠️ Secret Number ⚠️',
        msg: 'Invalid table selection.',
      );
      await Music().player.play(Music().audioInvalid);
    } else {
      Methods().dialogNumberTable(
        context,
        title: '🪄 Secret Food 🪄',
        number: numberList[sum - 1].toString(),
      );
      await Music().player.play(Music().audioSuccess);
    }
  }
}
