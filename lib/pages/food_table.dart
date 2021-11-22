// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// addition, subtraction, multiplication and division

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:numagic/widgets/appbar.dart';

class FoodTablePage extends StatefulWidget {
  const FoodTablePage({Key? key}) : super(key: key);

  @override
  State<FoodTablePage> createState() => _FoodTablePageState();
}

class _FoodTablePageState extends State<FoodTablePage> {
  // Fetch content from the json file
  // Tried to but couldn't get it to work
  // couldn't set value on List<Map<String, dynamic>> _numberTableList

  // var _foodTableListLength = _foodTableList.length;
  late List<List<int>> _currentTableList;

  @override
  void initState() {
    _currentTableList = _foodTableList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[9 % Colors.primaries.length];
    var platform = Theme.of(context).platform;

    // foodTableListLength -= 5;
    // print(_foodTableList[0][0][0]);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(title: 'Food Table'),
      extendBodyBehindAppBar: true,

      // backgroundColor: Colors.transparent,
      body:
          // BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          //     child:
          SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: platform == TargetPlatform.android ||
                    platform == TargetPlatform.iOS
                ? 130
                : 65),
        child: Center(
          child: Column(
            children: <Widget>[
              // MaterialButton(
              //     onPressed: () => print(_foodTableListLength == 0
              //         ? 0
              //         : _foodTableListLength -= 5),
              //     child: Text('Add Food')),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(5),
                width: 500,
                height: 105,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Colors.grey,
                    // width: 5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  """
RULES:
* Hold a secret number from 1 to 63.
* Select the tables below containing
  the secret number you're holding.
* Press Submit to get the secret number.
""",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Consolas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) => value
                          //       _numberTableCheckbox[data['id'] - 1] = value!;
                          //       _numberTableWidget =
                          //           _numberTable(_numberTableList[data['id'] - 1]);
                          // }),
                          ),
                      Text('Table no. 1',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(width: 15),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 2.5,
                            ),
                          ],
                          color: color,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 80,
                        height: 35,
                        // color: color.withOpacity(0.5),
                        child: MaterialButton(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          onPressed: () => setState(
                            () => {},
                          ),
                          elevation: 2.5,
                          child: Icon(Icons.arrow_back_ios_new, color: color),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 2.5,
                            ),
                          ],
                          color: color,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 80,
                        height: 35,
                        // color: color.withOpacity(0.5),
                        child: MaterialButton(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          onPressed: () => setState(
                            () => {},
                          ),
                          elevation: 2.5,
                          child: Icon(Icons.arrow_forward_ios, color: color),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              FoodTable(itemList: _foodList, tableList: _currentTableList),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 90,
                      height: 40,
                      // color: color.withOpacity(0.5),
                      child: MaterialButton(
                          color: color,
                          onPressed: () {},
                          elevation: 10,
                          child: Text('Submit',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor)))),
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 90,
                      height: 40,
                      // color: color.withOpacity(0.5),
                      child: MaterialButton(
                          color: color,
                          onPressed: () {},
                          elevation: 10,
                          child: Text('Reset',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor)))),
                ],
              ),
              SizedBox(height: 20),
              Center(
                  child: Text('Secret Food',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('_outText',
                      style: TextStyle(fontFamily: 'Consolas', fontSize: 50)),
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}

const _foodTableList = <List<List<int>>>[
  [
    [3, 5, 7, 9, 11, 1],
    [13, 15, 17, 19, 21, 23],
    [25, 27, 29, 31, 33, 35],
    [37, 39, 41, 43, 45, 47],
    [44, 51, 53, 55, 57, 59]
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
    "name": "Boiled Egg",
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
    "name": "Breakfast Sandwich",
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
    "name": "Chocolate-Milk",
    "image": "assets/images/foods/chocolate-milk-150x150.png"
  },
  {
    "id": 15,
    "name": "Coconut-Milk",
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
    "name": "French-bread",
    "image": "assets/images/foods/French-bread-150x150.png"
  },
  {
    "id": 22,
    "name": "Fried-chicken",
    "image": "assets/images/foods/fried-chicken-150x150.png"
  },
  {"id": 23, "name": "Fries", "image": "assets/images/foods/Fries-150x150.png"},
  {
    "id": 24,
    "name": "Fruit-Juice",
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
    "name": "Green-Tea",
    "image": "assets/images/foods/green-tea-150x150.png"
  },
  {"id": 28, "name": "Honey", "image": "assets/images/foods/Honey-150x150.png"},
  {
    "id": 29,
    "name": "Hot-chocolate",
    "image": "assets/images/foods/hot-chocolate2-150x150.png"
  },
  {
    "id": 30,
    "name": "Hot-dog",
    "image": "assets/images/foods/Hot-Dog-150x150.png"
  },
  {
    "id": 31,
    "name": "Ice-cream",
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
    "name": "Milk-shake",
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
    "name": "Orange-juice",
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
    "name": "Roast-chicken",
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
    "name": "Soft-drink",
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
  const FoodTable({Key? key, required this.itemList, required this.tableList})
      : super(key: key);
  final List<Map<String, dynamic>> itemList;
  final List<List<int>> tableList;

  Padding _foodTableCell({required String name, required String image}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            // fit: BoxFit.cover,
          ),
          Text(
            name,
            style: TextStyle(
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
            color: Colors.black, style: BorderStyle.solid, width: 2),
        children: <TableRow>[
          for (var i = 0; i < tableList.length; i++)
            TableRow(children: <Widget>[
              // Text('data'),
              for (var j = 0; j < tableList[i].length; j++)
                _foodTableCell(
                    image: itemList[tableList[i][j] - 1]['image'],
                    name: itemList[tableList[i][j] - 1]['name']),
            ]),
        ]);
  }
}
