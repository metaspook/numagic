import 'package:flutter/cupertino.dart';
import 'package:numagic/utils/utils.dart';

class AppBarController extends ChangeNotifier {
  //  checkbox related.
  static List<bool> get _initCheckboxList =>
      List<bool>.filled(Constants().foodTables.length, false);
  List<bool> _checkboxList = _initCheckboxList;

  List<bool> get checkboxList => _checkboxList;
  bool getCheckbox(int index) => _checkboxList[index];

  Future<void> setCheckbox(int index, bool value) async {
    _checkboxList[index] = value;
    notifyListeners();
  }

  void resetCheckbox() {
    _checkboxList = _initCheckboxList;
    notifyListeners();
  }
}
