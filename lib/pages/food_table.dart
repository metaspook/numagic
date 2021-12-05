import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numagic/models/food_list.dart';
import 'package:numagic/models/table_list.dart';
import 'package:numagic/mods.dart';
import 'package:numagic/widgets/custom_divider.dart';

class FoodTablePage extends StatefulWidget {
  const FoodTablePage({Key? key}) : super(key: key);

  @override
  State<FoodTablePage> createState() => _FoodTablePageState();
}

class _FoodTablePageState extends State<FoodTablePage> {
  List _foodList2 = [];
  // final GlobalKey _key = GlobalKey();

  final Color color = modColors.elementAt(Random().nextInt(modColors.length));
  // Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final ScrollController _scrollController = ScrollController();
  // late String _tableTitle;
  var _tableIndex = 0;
  bool _scrollStatus = false;
  bool _showFloatingButton = true;
  bool _gameStarted = false;
  String? _outImage, _outName;
  List<bool> _tableCheckbox = [
    for (var i = 0; i < tableList.length; i++) false
  ];

  void _showDialog([String? title, String? image, String? name]) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black, width: 5),
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child:
              AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  // elevation: 15,
                  backgroundColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.75),
                  title: Column(
                    children: [
                      Text(
                        title!,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      CustomDivider(),
                    ],
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (image != null)
                        Image.asset(
                          image,
                          // fit: BoxFit.scaleDown,
                          // height: 150,
                          // width: 150,
                        ),
                      Text(
                        name!,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  actions: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('OK', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ]
                  // ),
                  );
        });
  }

  void _setCheckbox([value]) => setState(() =>
      _tableCheckbox[_tableIndex] = value ?? !_tableCheckbox[_tableIndex]);

  void _submitTable() {
    int sum = 0;
    for (var i = 0; i < tableList.length; i++) {
      if (_tableCheckbox[i] == true) {
        sum += tableList[i][0][5];
      }
    }
    if (sum == 0 || sum > _foodList2.length) {
      _outImage = null;
      _outName = null;
      _showDialog(
        '⚠️ Secret Food ⚠️',
        null,
        'Invalid table selection.',
      );
    } else {
      _outImage = _foodList2[sum - 1]['image'];
      _outName = _foodList2[sum - 1]['name'];
      _showDialog(
        '🪄 Secret Food 🪄',
        _outImage!,
        _outName!,
      );
      // setState(() => _showFloatingButton = true);
    }
  }

  void _resetTable() => setState(() {
        _tableCheckbox = [for (var i = 0; i < tableList.length; i++) false];
        _tableIndex = 0;
        _outImage = null;
        _outName = null;
        _showFloatingButton = true;
        _gameStarted = false;
        _scrollBottom();
      });

  void _scrollListener() {
    if (isShrink != _scrollStatus) setState(() => _scrollStatus = isShrink);
  }

  void _scrollTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.elasticOut);
    }
  }

  void _scrollBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(_scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.elasticOut);
    }
  }

  bool get isShrink =>
      _scrollController.hasClients &&
      _scrollController.offset > 130 - kToolbarHeight;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    // _readJson();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(_scrollController.offset);
    final size = MediaQuery.of(context).size;
    // var platform = Theme.of(context).platform;
    return Scaffold(
      // appBar: const AppBarWidget(title: 'Food Table'),
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: CustomScrollView(
          physics: _gameStarted
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: color.withOpacity(0.75),
              title: _gameStarted && isShrink
                  ? GestureDetector(
                      onTap: _setCheckbox,
                      child: Row(children: [
                        Checkbox(
                            activeColor: Colors.black.withOpacity(0.65),
                            checkColor: color,
                            value: _tableCheckbox[_tableIndex],
                            onChanged: (value) => _setCheckbox(value)),
                        Text('Table No. ${_tableIndex + 1}'),
                      ]),
                    )
                  : Text('Steps:'),
              centerTitle: true,
              expandedHeight: 235 - kToolbarHeight,
              // expandedHeight: 0.22 * (size.height + kToolbarHeight),
              // elevation: 10,
              // floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                  top: 0.16 * size.height,
                  // top: 0.150 * (size.height + kToolbarHeight),
                ),
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: size.width * 0.70,
                    height: size.height * 0.090,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white54,
                        // width: 5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      """
 1. Keep secret a food from any of the
    6 tables below.
 2. Select all the tables containing
    the food you kept secret.
 3. Submit, I'll show you the MAGIC 🪄
""",
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Consolas',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              // hasScrollBody: false,
              child: _gameStarted
                  ? Swiper(
                      onIndexChanged: (index) => setState(() {
                        _tableIndex = index;
                        _scrollTop();
                      }),
                      control: SwiperControl(size: 40, color: color),
                      // pagination: const SwiperPagination(),
                      itemCount: tableList.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: SizedBox(
                            // height: 0.72 * size.height,
                            height: 630 - kToolbarHeight,
                            // height: 0.75 * size.height,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5),
                              child: FoodTable(tableList[index]),
                            ),
                          ),
                        );
                      },
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 5, right: 5),
                      child: Stack(
                        children: [
                          FoodTable(tableList[_tableIndex]),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                            child: SizedBox(
                                width: size.width, height: size.height),
                          )
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: _showFloatingButton
          ? Align(
              widthFactor: 2.05,
              heightFactor: 8,
              // alignment: Alignment.center,
              child: Container(
                width: 175,
                height: 80,
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: color.withOpacity(0.75),
                      blurRadius: 15,
                      spreadRadius: 1.5,
                    ),
                  ],
                ),
                child: FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    _gameStarted = true;
                    _showFloatingButton = false;
                    _scrollTop();
                  },
                  backgroundColor: color.withOpacity(0.75),
                  elevation: 0,
                  highlightElevation: 0,
                  enableFeedback: true,
                  label: const Text('Start',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                  icon: const Icon(Icons.forward_rounded, size: 50),
                ),
              ),
            )
          : Align(
              widthFactor: 0.940,
              heightFactor: 5,
              // widthFactor: size.width * 0.00240,
              // alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: color,
                          blurRadius: 25,
                          spreadRadius: 2.5,
                        ),
                      ],
                    ),
                    child: FloatingActionButton.extended(
                      onPressed: _submitTable,
                      backgroundColor: color.withOpacity(0.75),
                      elevation: 0,
                      highlightElevation: 0,
                      enableFeedback: true,
                      label:
                          const Text('Submit', style: TextStyle(fontSize: 16)),
                      icon: const Icon(Icons.check, size: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: color,
                          blurRadius: 25,
                          spreadRadius: 2.5,
                        ),
                      ],
                    ),
                    child: FloatingActionButton.extended(
                      onPressed: _resetTable,
                      backgroundColor: color.withOpacity(0.75),
                      elevation: 0,
                      highlightElevation: 0,
                      enableFeedback: true,
                      label:
                          const Text('Reset', style: TextStyle(fontSize: 16)),
                      icon: const Icon(Icons.refresh_outlined, size: 18),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

Future<List<FoodList>> fetchFoodList() async {
  final String response =
      await rootBundle.loadString('assets/json/food_list.json');
  return [for (var i in jsonDecode(response)) FoodList.fromMap(i)];
}

class FoodTable extends StatelessWidget {
  FoodTable(this.itemTable, {Key? key}) : super(key: key);
  final List<List<int>> itemTable;

  final Color color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  Padding _foodTableCell({required String name, required String image}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            // fit: BoxFit.cover,
          ),
          Text(
            name,
            style: const TextStyle(
              // color: Colors.black,
              color: Colors.white60,
              fontWeight: FontWeight.bold,
              // fontFamily: 'Consolas',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FoodList>>(
      future: fetchFoodList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Table(
              // defaultColumnWidth: FixedColumnWidth(size.width * 0.15),
              border: TableBorder.all(
                // color: Colors.black,
                color: Colors.white38,
                style: BorderStyle.solid,
                width: 2,
              ),
              children: <TableRow>[
                for (var i = 0; i < itemTable.length; i++)
                  TableRow(children: <Widget>[
                    for (var j = 0; j < itemTable[i].length; j++)
                      _foodTableCell(
                        image: snapshot.data![itemTable[i][j] - 1].image,
                        name: snapshot.data![itemTable[i][j] - 1].name,
                      )
                  ]),
              ]);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
// const tableList = <List<List<int>>>[
// const List<Map<String, dynamic>> _foodList = [

  // Fetch content from the json file
  // Future<void> _readJson() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json/food_list.json');
  //   // final response = await http.get(uri); //network data
  //   final data = await jsonDecode(response);
  //   // print(fetchFoodList());
  //   setState(() => _foodList2 = data);
  // }

  // Future<FoodList> fetchFoodListOnline() async {
  //   final String url = 'https://jsonplaceholder.typicode.com/albums/1';
  //   var response = await http.get(Uri.parse(url), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //   });
  //   if (response.statusCode == 200) {
  //     // If the call to the server was successful, parse the JSON
  //     return FoodList.fromJson(json.decode(response.body));
  //   } else {
  //     // If that call was not successful, throw an error.
  //     throw Exception('Failed to load post');
  //   }
  // }

// final response = await http.get(uri); //network data-
// final jsonData = '{ "name": "Pizza da Mario", "cuisine": "Italian" }';
// final jsonData = response.body;
// final parsedJson = jsonDecode(jsonData);

// class FoodTable extends StatelessWidget {
//   FoodTable({Key? key, required this.itemList, required this.itemTable})
//       : super(key: key);
//   final List<dynamic> itemList;
//   // final List<Map<String, dynamic>> itemList;
//   final List<List<int>> itemTable;

//   final Color color =
//       Colors.primaries[Random().nextInt(Colors.primaries.length)];
//   Padding _foodTableCell({required String name, required String image}) {
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         children: <Widget>[
//           Image.asset(
//             image,
//             // fit: BoxFit.cover,
//           ),
//           Text(
//             name,
//             style: const TextStyle(
//               // color: Colors.black,
//               color: Colors.white60,
//               fontWeight: FontWeight.bold,
//               // fontFamily: 'Consolas',
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Table(
//         // defaultColumnWidth: FixedColumnWidth(size.width * 0.15),
//         border: TableBorder.all(
//           // color: Colors.black,
//           color: Colors.white38,
//           style: BorderStyle.solid,
//           width: 2,
//         ),
//         children: <TableRow>[
//           for (var i = 0; i < itemTable.length; i++)
//             TableRow(children: <Widget>[
//               // Text('data'),
//               for (var j = 0; j < itemTable[i].length; j++)
//                 _foodTableCell(
//                     image: itemList[itemTable[i][j] - 1]['image'],
//                     name: itemList[itemTable[i][j] - 1]['name']),
//             ]),
//         ]);
//   }
// }
