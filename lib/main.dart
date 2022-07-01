import 'package:flutter/material.dart';
import 'package:numagic/controllers/controllers.dart';
import 'package:numagic/nu_magic_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FoodTableController>(
          create: (_) => FoodTableController(),
        ),
        ChangeNotifierProvider<NumberTableController>(
          create: (_) => NumberTableController(),
        ),
      ],
      child: const NuMagicApp(),
    ),
  );
}
