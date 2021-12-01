import 'dart:math';
import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:numagic/widgets/custom_divider.dart';

class FoodTablePage extends StatefulWidget {
  const FoodTablePage({Key? key}) : super(key: key);

  @override
  State<FoodTablePage> createState() => _FoodTablePageState();
}

class _FoodTablePageState extends State<FoodTablePage> {
  // final GlobalKey _key = GlobalKey();
  final Color color =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final ScrollController _scrollController = ScrollController();
  // late String _tableTitle;
  var _tableIndex = 0;
  bool _scrollStatus = false;
  bool _showFloatingButton = true;
  bool _gameStarted = false;
  String? _outImage, _outName;
  List<bool> _tableCheckbox = [
    for (var i = 0; i < _tableList.length; i++) false
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
    for (var i = 0; i < _tableList.length; i++) {
      if (_tableCheckbox[i] == true) {
        sum += _tableList[i][0][5];
      }
    }
    if (sum == 0 || sum > _foodList.length) {
      _outImage = null;
      _outName = null;
      _showDialog(
        'Secret Food',
        null,
        '⚠️⚠️⚠️⚠️\nInvalid table selection.',
      );
    } else {
      _outImage = _foodList[sum - 1]['image'];
      _outName = _foodList[sum - 1]['name'];
      _showDialog(
        'Secret Food',
        _outImage!,
        _outName!,
      );
      // setState(() => _showFloatingButton = true);
    }
  }

  void _resetTable() => setState(() {
        _tableCheckbox = [for (var i = 0; i < _tableList.length; i++) false];
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
      // backgroundColor: Colors.transparent,
      body: CustomScrollView(
        physics: _gameStarted
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: color,
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
                : Text('Rules:'),
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
 * Hold a secret food from any of the.
   tables below.
 * Select the tables below containing
   the secret food you're hiding.
 * Press Submit to get the secret food.
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
                    itemCount: _tableList.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: SizedBox(
                          // height: 0.72 * size.height,
                          height: 630 - kToolbarHeight,
                          // height: 0.75 * size.height,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 5, right: 5),
                            child: FoodTable(
                                itemList: _foodList,
                                itemTable: _tableList[index]),
                          ),
                        ),
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: Stack(
                      children: [
                        FoodTable(
                          itemList: _foodList,
                          itemTable: _tableList[_tableIndex],
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                          child:
                              SizedBox(width: size.width, height: size.height),
                        )
                      ],
                    ),
                  ),
          ),
        ],
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
                      color: color,
                      blurRadius: 25,
                      spreadRadius: 2.5,
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

const _tableList = <List<List<int>>>[
  [
    [3, 5, 7, 9, 11, 1],
    [13, 15, 17, 19, 21, 23],
    [25, 27, 29, 31, 33, 35],
    [37, 39, 41, 43, 45, 47],
    [49, 51, 53, 55, 57, 59]
  ],
  [
    [5, 6, 7, 13, 12, 4],
    [14, 15, 20, 21, 22, 23],
    [28, 29, 30, 31, 36, 37],
    [38, 39, 44, 45, 46, 47],
    [52, 53, 54, 55, 60, 13]
  ],
  [
    [9, 10, 11, 12, 13, 8],
    [14, 15, 20, 21, 22, 23],
    [28, 29, 30, 31, 40, 41],
    [42, 43, 44, 45, 46, 47],
    [56, 57, 58, 59, 60, 13]
  ],
  [
    [3, 6, 7, 10, 11, 2],
    [14, 15, 18, 19, 22, 23],
    [26, 27, 30, 31, 34, 35],
    [38, 39, 42, 43, 46, 47],
    [50, 51, 54, 55, 58, 59]
  ],
  [
    [17, 18, 19, 20, 21, 16],
    [22, 23, 24, 25, 26, 27],
    [28, 29, 30, 31, 48, 49],
    [50, 51, 52, 53, 54, 55],
    [56, 57, 58, 59, 60, 31]
  ],
  [
    [33, 34, 35, 36, 37, 32],
    [38, 39, 40, 41, 42, 43],
    [44, 45, 46, 55, 48, 49],
    [50, 51, 52, 53, 54, 47],
    [56, 57, 58, 59, 60, 46]
  ]
];

const List<Map<String, dynamic>> _foodList = [
  {"id": 1, "name": "Apple", "image": "assets/images/foods/Apple-150x150.png"},
  {
    "id": 2,
    "name": "Biscuit",
    "image": "assets/images/foods/biscuit-150x150.png"
  },
  {
    "id": 3,
    "name": "Boiled\nEgg",
    "image": "assets/images/foods/Boiled-egg-150x150.png"
  },
  {"id": 4, "name": "Bread", "image": "assets/images/foods/Bread-150x150.png"},
  {
    "id": 5,
    "name": "Breadsticks",
    "image": "assets/images/foods/Breadsticks-150x150.png"
  },
  {
    "id": 6,
    "name": "Breakfast\nSandwich",
    "image": "assets/images/foods/breakfast-sandwich-150x150.png"
  },
  {
    "id": 7,
    "name": "Burger",
    "image": "assets/images/foods/burger-150x150.png"
  },
  {
    "id": 8,
    "name": "Butter",
    "image": "assets/images/foods/Butter-150x150.png"
  },
  {
    "id": 9,
    "name": "Candies",
    "image": "assets/images/foods/Candies-150x150.png"
  },
  {
    "id": 10,
    "name": "Cheese",
    "image": "assets/images/foods/Cheese-150x150.png"
  },
  {
    "id": 11,
    "name": "Cheeseburger",
    "image": "assets/images/foods/cheeseburger-150x150.png"
  },
  {"id": 12, "name": "Chips", "image": "assets/images/foods/chip-150x150.png"},
  {
    "id": 13,
    "name": "Chocolate",
    "image": "assets/images/foods/Chocolate-150x150.png"
  },
  {
    "id": 14,
    "name": "Chocolate\nMilk",
    "image": "assets/images/foods/chocolate-milk-150x150.png"
  },
  {
    "id": 15,
    "name": "Coconut\nMilk",
    "image": "assets/images/foods/coconut-milk-1-150x150.png"
  },
  {
    "id": 16,
    "name": "Coffee",
    "image": "assets/images/foods/coffee2-150x150.png"
  },
  {
    "id": 17,
    "name": "Cookies",
    "image": "assets/images/foods/Cookies-150x150.png"
  },
  {
    "id": 18,
    "name": "Croissant",
    "image": "assets/images/foods/croissant-150x150.png"
  },
  {
    "id": 19,
    "name": "Donut",
    "image": "assets/images/foods/donut-2-150x150.png"
  },
  {"id": 20, "name": "Fish", "image": "assets/images/foods/fish-150x150.png"},
  {
    "id": 21,
    "name": "French\nbread",
    "image": "assets/images/foods/French-bread-150x150.png"
  },
  {
    "id": 22,
    "name": "Fried\nchicken",
    "image": "assets/images/foods/fried-chicken-150x150.png"
  },
  {"id": 23, "name": "Fries", "image": "assets/images/foods/Fries-150x150.png"},
  {
    "id": 24,
    "name": "Fruit\nJuice",
    "image": "assets/images/foods/fruit-juice-150x150.png"
  },
  {
    "id": 25,
    "name": "Fruits",
    "image": "assets/images/foods/Fruits-150x150.png"
  },
  {
    "id": 26,
    "name": "Grape",
    "image": "assets/images/foods/Grapes-150x150.png"
  },
  {
    "id": 27,
    "name": "Green\nTea",
    "image": "assets/images/foods/green-tea-150x150.png"
  },
  {"id": 28, "name": "Honey", "image": "assets/images/foods/Honey-150x150.png"},
  {
    "id": 29,
    "name": "Hot\nchocolate",
    "image": "assets/images/foods/hot-chocolate2-150x150.png"
  },
  {
    "id": 30,
    "name": "Hot\ndog",
    "image": "assets/images/foods/Hot-Dog-150x150.png"
  },
  {
    "id": 31,
    "name": "Ice\ncream",
    "image": "assets/images/foods/Ice-cream-150x150.png"
  },
  {"id": 32, "name": "Jam", "image": "assets/images/foods/Jam-150x150.png"},
  {"id": 33, "name": "Kebab", "image": "assets/images/foods/kebab-150x150.png"},
  {
    "id": 34,
    "name": "Lemonade",
    "image": "assets/images/foods/lemonade2-150x150.png"
  },
  {"id": 35, "name": "Meat", "image": "assets/images/foods/Meat-150x150.png"},
  {"id": 36, "name": "Milk", "image": "assets/images/foods/Milk-150x150.png"},
  {
    "id": 37,
    "name": "Milk\nshake",
    "image": "assets/images/foods/milkshake1-150x150.png"
  },
  {
    "id": 38,
    "name": "Muffin",
    "image": "assets/images/foods/muffins-150x150.png"
  },
  {
    "id": 39,
    "name": "Noodle",
    "image": "assets/images/foods/Noodle-150x150.webp"
  },
  {
    "id": 40,
    "name": "Omelet",
    "image": "assets/images/foods/omelet-150x150.png"
  },
  {
    "id": 41,
    "name": "Orange\njuice",
    "image": "assets/images/foods/orange-juice-1-150x150.png"
  },
  {
    "id": 42,
    "name": "Pancake",
    "image": "assets/images/foods/Pancakes-150x150.png"
  },
  {
    "id": 43,
    "name": "Pasta",
    "image": "assets/images/foods/Pasta-150x150.webp"
  },
  {"id": 44, "name": "Pizza", "image": "assets/images/foods/pizza-150x150.png"},
  {"id": 45, "name": "Rice", "image": "assets/images/foods/Rice-150x150.png"},
  {
    "id": 46,
    "name": "Roast\nchicken",
    "image": "assets/images/foods/Roast-chicken-150x150.png"
  },
  {"id": 47, "name": "Roll", "image": "assets/images/foods/roll-150x150.png"},
  {"id": 48, "name": "Salad", "image": "assets/images/foods/Salad-150x150.png"},
  {
    "id": 49,
    "name": "Sandwich",
    "image": "assets/images/foods/sandwich-150x150.png"
  },
  {
    "id": 50,
    "name": "Sausage",
    "image": "assets/images/foods/Sausages-150x150.png"
  },
  {
    "id": 51,
    "name": "Seafood",
    "image": "assets/images/foods/Seafood-150x150.png"
  },
  {
    "id": 52,
    "name": "Soft\ndrink",
    "image": "assets/images/foods/soft-drink-150x150.png"
  },
  {"id": 53, "name": "Soup", "image": "assets/images/foods/Soup-150x150.png"},
  {"id": 54, "name": "Steak", "image": "assets/images/foods/steak-150x150.png"},
  {"id": 55, "name": "Taco", "image": "assets/images/foods/taco-150x150.png"},
  {"id": 56, "name": "Tea", "image": "assets/images/foods/Tea-150x150.png"},
  {
    "id": 57,
    "name": "Vegetables",
    "image": "assets/images/foods/Vegetables-150x150.png"
  },
  {
    "id": 58,
    "name": "Water",
    "image": "assets/images/foods/water-1-150x150.png"
  },
  {
    "id": 59,
    "name": "Watermelon",
    "image": "assets/images/foods/Watermelon-150x150.png"
  },
  {
    "id": 60,
    "name": "Yogurt",
    "image": "assets/images/foods/yogurt-150x150.png"
  }
];

class FoodTable extends StatelessWidget {
  FoodTable({Key? key, required this.itemList, required this.itemTable})
      : super(key: key);
  final List<Map<String, dynamic>> itemList;
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
              color: Colors.black,
              // color: Colors.white60,
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
    return Table(
        // defaultColumnWidth: FixedColumnWidth(size.width * 0.15),
        border: TableBorder.all(
          color: Colors.black,
          // color: Colors.white38,
          style: BorderStyle.solid,
          width: 2,
        ),
        children: <TableRow>[
          for (var i = 0; i < itemTable.length; i++)
            TableRow(children: <Widget>[
              // Text('data'),
              for (var j = 0; j < itemTable[i].length; j++)
                _foodTableCell(
                    image: itemList[itemTable[i][j] - 1]['image'],
                    name: itemList[itemTable[i][j] - 1]['name']),
            ]),
        ]);
  }
}
