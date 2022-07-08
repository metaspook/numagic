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

  // Tables reversing.
  static bool _isReverseColumn = Random().nextBool();
  static bool _isReverseRow = Random().nextBool();

  // Tables randomizer.
  static List<List<List<int>>> _tablesRandomizer({
    required List<List<List<int>>> tables,
    required bool isReverseColumn,
    required bool isReverseRow,
  }) {
    List<List<List<int>>> randomTables = tables..shuffle();
    if (_isReverseColumn) {
      randomTables = [
        ...randomTables.map<List<List<int>>>((column) => [...column.reversed])
      ];
    }
    if (_isReverseRow) {
      randomTables = [
        ...randomTables.map<List<List<int>>>((column) => [
              ...column.map<List<int>>((row) => [...row.reversed])
            ])
      ];
    }
    return randomTables;
  }

  // Tables resetting.
  void resetTable(TableType tableType) {
    _isReverseRow = Random().nextBool();
    _isReverseColumn = Random().nextBool();
    switch (tableType) {
      case TableType.food:
        _foodTables = _tablesRandomizer(
          tables: Constants().foodTables,
          isReverseColumn: _isReverseColumn,
          isReverseRow: _isReverseRow,
        );
        break;
      case TableType.number:
        _numberTables = _tablesRandomizer(
          tables: Constants().numberTables,
          isReverseColumn: _isReverseColumn,
          isReverseRow: _isReverseRow,
        );
        break;
    }
    setTableIndex(0);
  }

  // Food table related.
  List<List<List<int>>> _foodTables = _tablesRandomizer(
    tables: Constants().foodTables,
    isReverseColumn: _isReverseColumn,
    isReverseRow: _isReverseRow,
  );
  List<List<List<int>>> get foodTables => _foodTables;

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

  // Number table related.
  List<List<List<int>>> _numberTables = _tablesRandomizer(
    tables: Constants().numberTables,
    isReverseColumn: _isReverseColumn,
    isReverseRow: _isReverseRow,
  );
  List<List<List<int>>> get numberTables => _numberTables;

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
