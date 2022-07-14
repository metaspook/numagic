import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  // about button.
  bool _isAbout = true;
  bool get getAboutState => _isAbout;

  void setAboutState() {
    _isAbout = !_isAbout;
    notifyListeners();
  }

  // copyright date.
  static final int _currentYear = DateTime.now().year;
  final String _currentYearLine =
      "2022${_currentYear > 2022 ? '-$_currentYear' : ''}";
  String get currentYearLine => _currentYearLine;
}
