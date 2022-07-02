import 'package:flutter/material.dart';
import 'package:numagic/utils/utils.dart';

class HomeController extends ChangeNotifier {
  bool _isAbout = true;
  bool get getAboutState => _isAbout;

  void setAboutState() {
    _isAbout = !_isAbout;
    notifyListeners();
  }

  Future<void> gridPageRoute(BuildContext context, Widget page) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
    await Music().player.play(Music().audioClick);
  }
}
