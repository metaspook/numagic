// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// addition, subtraction, multiplication and division

import 'package:flutter/material.dart';

class HiddenDigit1 extends StatefulWidget {
  const HiddenDigit1({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HiddenDigit1> createState() => _HiddenDigit1State();
}

class _HiddenDigit1State extends State<HiddenDigit1> {
  String text = '';
  final TextEditingController _intputController = TextEditingController();

  int _toSum(int number) {
    String strNum = number.toString();
    int sum = 0;
    for (int i = 0; i < strNum.length; i++) {
      sum += int.tryParse(strNum[i])!;
    }
    return sum;
  }

  void _submitNumber() {
    setState(() {
      try {
        if (_intputController.text.isNotEmpty) {
          int sum = _toSum(int.parse(_intputController.text));
          // Formula to get hidden digit.
          int rum = 9;
          while (sum > rum) {
            rum += 9;
          }
          text = rum == sum ? '0 OR 9' : (rum - sum).toString();
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
      appBar: AppBar(title: Text(widget.title)),
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
                height: 355,
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
RULE: As example 1/2 get a Current number.

Example 1:
      847  <-- Hold a number you like.
      478  <-- Scramble as you like.
847 - 478  <-- Subtraction between holding
               and scrambled numbers.
    = 369  <-- Subtracted number.
       39  <-- *Current number,
                hide a digit as 6 here.

Example 2:
           847  <-- Hold a number you like.
8 + 4 + 7 = 19  <-- addition between digits
      847 - 19  <-- Subtract additioned
                    from holding.
         = 828  <-- Subtracted number.
            88  <-- *Current number,
                    hide a digit as 2 here.
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
                  child: Text('Hidden Digit',
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