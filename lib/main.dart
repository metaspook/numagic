import 'package:flutter/material.dart';
import 'package:numagic/pages/hidden_number_1.dart';
import 'package:numagic/pages/home.dart';
import 'package:numagic/pages/hidden_digit_1.dart';
import 'package:numagic/pages/number_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'NuMagic',
      theme: ThemeData(
        // appBarTheme: AppBarTheme(
        //   color: theme.appMainColor,
        //   titleTextStyle: const TextStyle(
        //     color: Colors.white,
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// Container(
 //   width: MediaQuery.of(context).size.width,
 //  height: MediaQuery.of(context).padding.top,