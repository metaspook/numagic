// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:numagic/pages/hidden_digit_1.dart';
import 'package:numagic/pages/number_table.dart';
import 'package:numagic/widgets/drawer.dart';
import 'package:numagic/widgets/items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
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
            ['Magic game 2', () {}],
            ['Magic game 3', () {}],
          ];
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
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
