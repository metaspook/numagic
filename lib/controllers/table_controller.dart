import 'package:flutter/material.dart';
import 'package:numagic/models/models.dart';
import 'package:numagic/utils/utils.dart';

enum TableType { food, number }

class TableController extends ChangeNotifier {
  // Table index related.
  int _tableIndex = 0;
  int get tableIndex => _tableIndex;
  Future<void> setTableIndex(int index) async {
    await Music().player.play(Music().audioClick);
    _tableIndex = index;
    notifyListeners();
  }

  // Table submission.
  Future<void> submitFoodTable(
    BuildContext context, {
    required List<Food> foodList,
    required List<bool> checkboxList,
  }) async {
    int sum = 0;
    for (int i = 0; i < checkboxList.length; i++) {
      if (checkboxList[i] == true) {
        sum += Constants().foodTableSet.elementAt(i).elementAt(0).elementAt(5);
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
        sum += Constants().foodTableSet.elementAt(i).elementAt(0).elementAt(0);
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
