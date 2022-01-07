import 'package:flutter/material.dart';

Widget homeContants(context) {
  return Column(
    // crossAxisAlignment: CrossAxisAlignment.center,
    // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.all(5),
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
              onPressed: () => () {},
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => FoodTablePage()),
              // ),
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
  );
}
