import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numagic/pages/food_table.dart';
import 'package:numagic/router.dart';
import 'package:numagic/widgets/appbar.dart';
import 'package:numagic/widgets/drawer.dart';
import 'package:numagic/widgets/items.dart';
import 'package:numagic/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    return Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: ThemeData.dark().primaryColor,
        appBar: const AppBarWidget(title: 'Magic Collection'),
        drawer: const DrawerWidget(),
        body: LayoutBuilder(builder: (context, constraints) {
          List<Map<String, dynamic>> itemList = [
            {
              "title": "Number Table",
              "function": () =>
                  navigator.routeManager.push(Uri.parse("/number_table"))
            },
            {
              "title": "Hidden Digit",
              "function": () =>
                  navigator.routeManager.push(Uri.parse("/hidden_digit"))
            },
            {
              "title": "Hidden Number",
              "function": () =>
                  navigator.routeManager.push(Uri.parse("/hidden_number"))
            },
            {
              "title": "Food Table",
              "function": () =>
                  // showCupertinoModalPopup(
                  //     context: context, builder: (context) => const FoodTablePage())
                  navigator.routeManager.push(Uri.parse("/food_table"))
            },
            {
              "title": "Carosal",
              "function": () =>
                  navigator.routeManager.push(Uri.parse("/carosal"))
            },
            {
              "title": "Place Holder",
              "function": () =>
                  navigator.routeManager.push(Uri.parse("/hidden_digit"))
            }
          ];

          return GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: platform == TargetPlatform.iOS ||
                        platform == TargetPlatform.android
                    ? 125
                    : 65),
            itemCount: itemList.length,
            itemBuilder: (context, index) => ItemWidget(
              index: index,
              title: itemList[index]["title"],
              function: itemList[index]["function"],
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: constraints.maxWidth > 1024
                  ? 4
                  : constraints.maxWidth > 800
                      ? 3
                      : constraints.maxWidth > 500
                          ? 2
                          : 2,
              // childAspectRatio: 5,
            ),
          );
        }));
  }
}
