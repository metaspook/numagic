// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// addition, subtraction, multiplication and division

import 'package:flutter/material.dart';
import 'package:numagic/widgets/appbar_mod.dart';

class HiddenNumber1 extends StatefulWidget {
  const HiddenNumber1({Key? key}) : super(key: key);

  @override
  State<HiddenNumber1> createState() => _HiddenNumber1State();
}

class _HiddenNumber1State extends State<HiddenNumber1> {
  String text = '';
  final TextEditingController _intputController = TextEditingController();

  void _submitNumber() {
    setState(() {
      try {
        if (_intputController.text.isNotEmpty) {
          // Formula to get hidden number.
          text = (int.parse(_intputController.text) - 4).toString();
        } else if (_intputController.text.isEmpty) {
          text = '';
        }
      } catch (e) {
        text = "ERROR: Invalid number try again.";
      }
    });
  }

  @override
  void dispose() {
    _intputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarMod(title: 'Hidden Number'),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(5),
                width: 500,
                height: 175,
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
RULE: As example get a Current number.

Example 1:
         75 <-- Hold a 2 digit number.
7 * 10 = 70 <-- multiply first digit by 10.
70 + 5 = 75 <-- Addition by second digit.
75 - 4 = 71 <-- Subtraction by 4
75 + 8 = 79 <-- Addition by 8
         79 <-- *Current number.
""",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Consolas',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextField(
                controller: _intputController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitNumber(),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(),
                  hintText: "Current number",
                  labelText: "Input",
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                      color: Colors.blue,
                      onPressed: _submitNumber,
                      elevation: 10,
                      child: Text('Submit',
                          style: TextStyle(
                              color:
                                  Theme.of(context).scaffoldBackgroundColor))),
                  MaterialButton(
                      color: Colors.blue,
                      onPressed: () => setState(() {
                            text = '';
                            _intputController.clear();
                          }),
                      elevation: 10,
                      child: Text('Clear',
                          style: TextStyle(
                              color:
                                  Theme.of(context).scaffoldBackgroundColor))),
                ],
              ),
              SizedBox(height: 20),
              Center(
                  child: Text('Hidden Number',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                width: 500,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(text,
                    style: TextStyle(fontFamily: 'Consolas', fontSize: 19)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//             Text("""

// 1. Hold any number, suppose 847.
// 2. Addition between digits  8, 4, 7,
//    it will be 8 + 4 + 7 = 19.
// 3. Now subtract 19 from 847,
//    it will be 847 - 19 = 828.
// 4. Hide a digit from 828, suppose you 
//    hide 2 Current number will be 88.
   

// Rules:
// 1. Hold a number you like.
// 2. Number 



// 1. Hold any number, Suppose you holding 847.
// 2. Do addition digits between 8, 4, 7,
//    it will be 8 + 4 + 7 = 19.
// 3. Now subtract 19 from 847,
//    it will be 847 - 19 = 828.

//    Example math:
//             847   <-- Holding number
// 8 + 4 + 7 = 19
//  847 - 19 = 828   <-- Secret number

// 4. Hide a digit from the Secret number.
// """, style: TextStyle(fontSize: 15, fontFamily: 'Consolas')),