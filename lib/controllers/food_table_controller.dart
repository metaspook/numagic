import 'package:flutter/material.dart';
import 'package:numagic/models/models.dart';
import 'package:numagic/utils/utils.dart';

class FoodTableController extends ChangeNotifier {
  String? _outImage, _outName;
  int _tableIndex = 0;

  int get tableIndex => _tableIndex;
  Future<void> setTableIndex(int index) async {
    await Music().player.play(Music().audioClick);
    _tableIndex = index;
    notifyListeners();
  }

  Future<void> submitTable(
    BuildContext context, {
    required List<Food> foodList,
    required List<bool> checkboxList,
  }) async {
    int sum = 0;
    for (var i = 0; i < Constants().foodTableSet.length; i++) {
      if (checkboxList[i] == true) {
        sum += Constants().foodTableSet.elementAt(i).elementAt(0).elementAt(5);
      }
    }
    if (sum == 0 || sum > foodList.length) {
      _outImage = null;
      _outName = null;
      Methods().showDialogMod(
        context,
        title: '⚠️ Secret Food ⚠️',
        image: null,
        name: 'Invalid table selection.',
      );
      await Music().player.play(Music().audioInvalid);
    } else {
      _outImage = foodList[sum - 1].image;
      _outName = foodList[sum - 1].name;
      Methods().showDialogMod(
        context,
        title: '🪄 Secret Food 🪄',
        image: _outImage,
        name: _outName,
      );
      await Music().player.play(Music().audioSuccess);
    }
  }
}
