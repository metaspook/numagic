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
  static bool _isReverseFoodColumn = Random().nextBool();
  static bool _isReverseFoodRow = Random().nextBool();
  static bool _isReverseNumberColumn = Random().nextBool();
  static bool _isReverseNumberRow = Random().nextBool();

  // Tables randomizer.
  static List<List<List<int>>> _tablesRandomizer({
    required List<List<List<int>>> tables,
    required bool isReverseColumn,
    required bool isReverseRow,
  }) {
    return tables.map<List<List<int>>>((column) {
      if (isReverseColumn) column = column.reversed.toList(growable: false);
      if (isReverseRow) {
        column = column
            .map<List<int>>((row) => row.reversed.toList(growable: false))
            .toList(growable: false);
      }
      return column;
    }).toList(growable: false)
      ..shuffle();
  }

  // Food table related.
  List<List<List<int>>> _foodTables = _tablesRandomizer(
    tables: Constants().foodTables,
    isReverseColumn: _isReverseFoodColumn,
    isReverseRow: _isReverseFoodRow,
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
            .elementAt(_isReverseFoodColumn ? 4 : 0)
            .elementAt(_isReverseFoodRow ? 0 : 5);
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
    isReverseColumn: _isReverseNumberColumn,
    isReverseRow: _isReverseNumberRow,
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
        sum += _numberTables
            .elementAt(i)
            .elementAt(_isReverseNumberColumn ? 3 : 0)
            .elementAt(_isReverseNumberRow ? 7 : 0);
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
        title: '🪄 Secret Number 🪄',
        number: numberList[sum - 1].toString(),
      );
      await Music().player.play(Music().audioSuccess);
    }
  }

  // Tables resetting.
  void resetTable(TableType tableType) {
    switch (tableType) {
      case TableType.food:
        _isReverseFoodColumn = Random().nextBool();
        _isReverseFoodRow = Random().nextBool();
        _foodTables = _tablesRandomizer(
          tables: Constants().foodTables,
          isReverseColumn: _isReverseFoodColumn,
          isReverseRow: _isReverseFoodRow,
        );
        break;
      case TableType.number:
        _isReverseNumberColumn = Random().nextBool();
        _isReverseNumberRow = Random().nextBool();
        _numberTables = _tablesRandomizer(
          tables: Constants().numberTables,
          isReverseColumn: _isReverseNumberColumn,
          isReverseRow: _isReverseNumberRow,
        );
        break;
    }
    setTableIndex(0);
  }
}
