// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/pages/hidden_digit_1.dart';
import 'package:numagic/pages/number_table.dart';
import 'package:numagic/widgets/appbar.dart';
import 'package:numagic/widgets/drawer.dart';
import 'package:numagic/widgets/items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: ThemeData.dark().primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[700]),
          title: Text(
            'NuMagic',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]),
          ),
          backgroundColor: Colors.black.withOpacity(0.1),
          elevation: 10,
          centerTitle: true,
          // systemOverlayStyle: SystemUiOverlayStyle.light,
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                // color: Colors.white.withOpacity(0.1),
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
        ),
        drawer: DrawerWidget(),
        body: LayoutBuilder(builder: (context, constraints) {
          List<dynamic> gameList = [
            [
              'Number Table',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NumberTable(
                      title: 'Number Table',
                    ),
                  ))
            ],
            [
              'Hidden Digit',
              () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HiddenDigit1(
                      title: 'Hidden Digit 1',
                    ),
                  ))
            ],
            ['Hidden Number', () {}],
            ['Magic game 3', () {}],
            ['Magic game 4', () {}],
            ['Magic game 5', () {}],
          ];
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 65),
            itemCount: gameList.length,
            itemBuilder: (context, index) => ItemWidget(
              index: index,
              title: gameList[index][0],
              func: gameList[index][1],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth > 1024
                  ? 4
                  : constraints.maxWidth > 800
                      ? 3
                      : constraints.maxWidth > 500
                          ? 2
                          : 1,
              childAspectRatio: 5,
            ),
          );
        }));
  }
}
