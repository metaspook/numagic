import 'package:flutter/material.dart';

class AppBarWidgetx extends StatelessWidget {
  final String title;

  const AppBarWidgetx({Key? key, required this.title}) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    final Color color = Colors.primaries[1 % Colors.primaries.length];
    return AppBar(title: Text(title), backgroundColor: color);
  }
}
