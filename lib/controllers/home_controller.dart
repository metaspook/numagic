import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  bool _isAbout = true;
  bool get getAboutState => _isAbout;

  void setAboutState() {
    _isAbout = !_isAbout;
    notifyListeners();
  }
}
