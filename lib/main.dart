import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:numagic/router.dart';

void main() {
  // Vx.setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      title: 'NuMagic',
      routeInformationParser: VxInformationParser(),
      routerDelegate: navigator,
    );
  }
}

// Container(
 //   width: MediaQuery.of(context).size.width,
 //  height: MediaQuery.of(context).padding.top,