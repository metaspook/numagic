import 'package:flutter/material.dart';
import 'package:numagic/controllers/controllers.dart';
import 'package:numagic/nu_magic_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppBarController>(
          create: (_) => AppBarController(),
        ),
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider<TableController>(
          create: (_) => TableController(),
        ),
      ],
      child: const NuMagicApp(),
    ),
  );
}
