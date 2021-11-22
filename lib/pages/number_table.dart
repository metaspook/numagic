// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// addition, subtraction, multiplication and division

import 'package:flutter/material.dart';
import 'package:numagic/widgets/appbar.dart';

class NumberTable extends StatefulWidget {
  const NumberTable({Key? key}) : super(key: key);

  @override
  State<NumberTable> createState() => _NumberTableState();
}

class _NumberTableState extends State<NumberTable> {
  // Fetch content from the json file
  // Tried to but couldn't get it to work
  // couldn't set value on List<Map<String, dynamic>> _numberTableList
  static const List<Map<String, dynamic>> _numberTableList = [
    {
      "id": 1,
      "first": [1, 3, 5, 7, 9, 11, 13, 15],
      "second": [17, 19, 21, 23, 25, 27, 29, 31],
      "third": [33, 35, 37, 39, 41, 43, 45, 47],
      "fourth": [49, 51, 53, 55, 57, 59, 61, 63]
    },
    {
      "id": 2,
      "first": [2, 3, 6, 7, 10, 11, 14, 15],
      "second": [18, 19, 22, 23, 26, 27, 30, 31],
      "third": [34, 35, 38, 39, 42, 43, 46, 47],
      "fourth": [50, 51, 54, 55, 58, 59, 62, 63]
    },
    {
      "id": 3,
      "first": [4, 5, 6, 7, 12, 13, 14, 15],
      "second": [20, 21, 22, 23, 28, 29, 30, 31],
      "third": [36, 37, 38, 39, 44, 45, 46, 47],
      "fourth": [52, 53, 54, 55, 60, 61, 62, 63]
    },
    {
      "id": 4,
      "first": [8, 9, 10, 11, 12, 13, 14, 15],
      "second": [24, 25, 26, 27, 28, 29, 30, 31],
      "third": [40, 41, 42, 43, 44, 45, 46, 47],
      "fourth": [56, 57, 58, 59, 60, 61, 62, 63]
    },
    {
      "id": 5,
      "first": [16, 17, 18, 19, 20, 21, 22, 23],
      "second": [24, 25, 26, 27, 28, 29, 30, 31],
      "third": [48, 49, 50, 51, 52, 53, 54, 55],
      "fourth": [56, 57, 58, 59, 60, 61, 62, 63]
    },
    {
      "id": 6,
      "first": [32, 33, 34, 35, 36, 37, 38, 39],
      "second": [40, 41, 42, 43, 44, 45, 46, 47],
      "third": [48, 49, 50, 51, 52, 53, 54, 55],
      "fourth": [56, 57, 58, 59, 60, 61, 62, 63]
    }
  ];
  late Widget _numberTableWidget;
  String _outText = '';
  List<bool> _numberTableCheckbox = [
    for (var i = 0; i < _numberTableList.length; i++) false
  ];

  // Number Table
  Widget _numberTable(Map<String, dynamic> data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Table no. ${data['id']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Checkbox(
                value: _numberTableCheckbox[data['id'] - 1],
                onChanged: (value) => setState(() {
                      _numberTableCheckbox[data['id'] - 1] = value!;
                      _numberTableWidget =
                          _numberTable(_numberTableList[data['id'] - 1]);
                    })),
          ],
        ),
        Table(
          // defaultColumnWidth: FixedColumnWidth(44),
          border: TableBorder.all(
              color: Colors.black, style: BorderStyle.solid, width: 2),
          children: [
            for (var key in data.keys)
              if (key != 'id')
                TableRow(children: [
                  for (var i = 0; i < data[key].length; i++)
                    Center(
                      heightFactor: 1.5,
                      child: Text(
                        data[key][i].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Consolas'),
                      ),
                    ),
                ]),
          ],
        ),
      ],
    );
  }

  // Number Table Button
  Widget _numberTableButton(int index) {
    return MaterialButton(
        color: Colors.blue,
        onPressed: () => setState(
            () => _numberTableWidget = _numberTable(_numberTableList[index])),
        elevation: 10,
        child: Text('${index + 1}',
            style:
                TextStyle(color: Theme.of(context).scaffoldBackgroundColor)));
  }

  void _submitNumberTable() {
    // Formula to get hidden number.
    int sum = 0;
    for (var i = 0; i < _numberTableList.length; i++) {
      if (_numberTableCheckbox[i] == true) {
        sum += _numberTableList[i]['first'][0] as int;
      }
    }
    setState(() => _outText = sum.toString());
  }

  void _resetNumberTable() {
    _numberTableCheckbox = [
      for (var i = 0; i < _numberTableList.length; i++) false
    ];
    _numberTableWidget = _numberTable(_numberTableList[0]);
    setState(() => _outText = '');
  }

  @override
  initState() {
    _numberTableWidget = _numberTable(_numberTableList[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBarWidget(title: 'Number Table'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
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
              _numberTableWidget,
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var i = 0; i < _numberTableList.length; i++)
                    Flexible(
                      child: SizedBox(
                        child: _numberTableButton(i),
                        width: 50,
                      ),
                    )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      color: Colors.blue,
                      onPressed: _submitNumberTable,
                      elevation: 10,
                      child: Text('Submit',
                          style: TextStyle(
                              color:
                                  Theme.of(context).scaffoldBackgroundColor))),
                  MaterialButton(
                      color: Colors.blue,
                      onPressed: _resetNumberTable,
                      elevation: 10,
                      child: Text('Reset',
                          style: TextStyle(
                              color:
                                  Theme.of(context).scaffoldBackgroundColor))),
                ],
              ),
              SizedBox(height: 20),
              Center(
                  child: Text('Secret Number',
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
                  child: Text(_outText,
                      style: TextStyle(fontFamily: 'Consolas', fontSize: 50)),
                ),
              ),
            ]),
          ),
        ));
  }
}
