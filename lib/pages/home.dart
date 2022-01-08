import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numagic/pages/food_table.dart';
import 'package:numagic/pages/translucent.dart';
import 'package:numagic/utils/methods.dart';
import 'package:numagic/utils/router.dart';
import 'package:numagic/widgets/all_foods.dart';
import 'package:numagic/widgets/appbar_mod.dart';
import 'package:numagic/widgets/drawer.dart';
import 'package:numagic/widgets/home_contants.dart';
import 'package:numagic/widgets/items.dart';
import 'package:numagic/main.dart';
import 'package:numagic/widgets/translucent_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color color = Methods.colorPrimariesRandom();

  var showFoodTable = true;

  @override
  Widget build(BuildContext context) {
    // dynamic _currentPage = homePage2(context);
    List<Map<String, dynamic>> itemList = [
      {
        "title": "Number Table",
        "function": () =>
            navigator.routeManager.push(Uri.parse("/number_table"))
      },
      {
        "title": "Food Table",
        "function": () => showCupertinoModalPopup(
            context: context, builder: (context) => const FoodTablePage())
        // navigator.routeManager.push(Uri.parse("/food_table"))
      },
    ];
    Size size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarMod(title: 'NuMagic 🪄'),
      drawer: const DrawerWidget(),
      // floatingActionButtonLocation: AllFoods.floatingActionButtonLocation(),
      // floatingActionButton: AllFoods.floatingActionButton(),
      body: TranslucentBackground(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Container(
                padding: const EdgeInsets.all(5),
                width: 380,
                height: 135,
                // width: size.width * 0.95,
                // height: size.height * 0.3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white54,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  """
 Instruction:
 1. Keep secret a Food or Number from
    any of the 6 tables.
 2. Select all the tables containing
    your secret Food or Number.
 3. Press Submit, I'll show MAGIC 🪄
""",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17.5,
                    fontFamily: 'Consolas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 130),
            Text('Choose Table Type',
                style: TextStyle(color: Colors.white70, fontSize: 25)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: const EdgeInsets.symmetric(
                  //     horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70, width: 2.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () => {},
                    // showCupertinoModalPopup(
                    //     context: context,
                    //     builder: (context) => const FoodTablePage()),
                    child: Text(
                      'Number',
                      style: TextStyle(color: Colors.white70, fontSize: 40),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  // height: 60,
                  // padding: const EdgeInsets.symmetric(
                  //     horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70, width: 2.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () =>
                        // () {},
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllFoods()),
                    ),
                    // showCupertinoModalPopup(
                    //     context: context,
                    //     builder: (context) => const FoodTablePage()),
                    child: Text(
                      'Food',
                      style: TextStyle(color: Colors.white70, fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// GridView.builder(
//     physics: NeverScrollableScrollPhysics(),
//     padding: EdgeInsets.only(top: 8),
//     // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

//     //   maxCrossAxisExtent: 100,
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: constraints.maxWidth > 1024
//           ? 4
//           : constraints.maxWidth > 800
//               ? 3
//               : constraints.maxWidth > 500
//                   ? 2
//                   : 2,
//       childAspectRatio: 1.5,
//     ),
//     itemCount: 20,
//     itemBuilder: (context, index) {
//       final Color color = Methods.colorPrimariesIndex(index);

//       return Padding(
//         padding: const EdgeInsets.all(5),
//         child: Container(
//           color: color,
//           child: TextButton(
//             onPressed: () => showCupertinoModalPopup(
//                 context: context,
//                 builder: (context) => const FoodTablePage()),
//             child: Text(
//               '',
//               style: TextStyle(color: Colors.white, fontSize: 25),
//             ),
//           ),
//         ),
//       );
//     });
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Flex(
//     direction:
//         constraints.maxWidth > 800 ? Axis.horizontal : Axis.vertical,
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     mainAxisSize: MainAxisSize.max,
//     children: [
//       Expanded(
//         child: ItemWidget(
//           index: 0,
//           title: "Numbers",
//           function: () =>
//               navigator.routeManager.push(Uri.parse("/number_table")),
//         ),
//       ),
//       Expanded(
//         child: ItemWidget(
//           index: 1,
//           title: "Foods",
//           function: () => showCupertinoModalPopup(
//               context: context,
//               builder: (context) => const FoodTablePage()),
//         ),
//       ),
//     ],
//   ),
// );

// LayoutBuilder(builder: (context, constraints) {

//   ];

// return
// ListView.builder(
//     padding: EdgeInsets.symmetric(
//         horizontal: 5,
//         vertical: platform == TargetPlatform.iOS ||
//                 platform == TargetPlatform.android
//             ? 125
//             : 65),
//     itemCount: itemList.length,
//     itemBuilder: (context, index) {
//       return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ItemWidget(
//           index: index,
//           title: itemList[index]["title"],
//           function: itemList[index]["function"],
//         ),
//       );
//     });

//     GridView.count(
//   padding: EdgeInsets.symmetric(
//       horizontal: 5,
//       vertical: platform == TargetPlatform.iOS ||
//               platform == TargetPlatform.android
//           ? 125
//           : 65),
//   children: [
//     ItemWidget(
//       index: 0,
//       title: "Number Table",
//       function: () =>
//           navigator.routeManager.push(Uri.parse("/number_table")),
//     ),
//     ItemWidget(
//       index: 0,
//       title: "Number Table",
//       function: () =>
//           navigator.routeManager.push(Uri.parse("/number_table")),
//     ),
//   ],

//   crossAxisCount: constraints.maxWidth > 1024
//       ? 4
//       : constraints.maxWidth > 800
//           ? 3
//           : constraints.maxWidth > 500
//               ? 1
//               : 1,
//   // childAspectRatio: 5,

// })
