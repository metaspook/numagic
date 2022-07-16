import 'package:flutter/material.dart';
import 'package:numagic/pages/pages.dart';

class NuMagicApp extends StatelessWidget {
  const NuMagicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NuMagic: Secret Revealer Magic',
      home: HomePage(),
    );
  }
}
