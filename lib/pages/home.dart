// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:numagic/widgets/custom_divider.dart';

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
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: Drawer(
          child: ListView(
            children: [
              // Drawer Header
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Row(
                    children: [
                      // Image.asset('assets/images/user_icon.png',
                      //     height: 65, width: 65),
                      // SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Game Collection',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // CustomDivider(),
              // SizedBox(height: 12),

              // Drawer Body
              ListTile(
                leading: Icon(Icons.history),
                title: Text('History', style: TextStyle(fontSize: 15)),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Visit Profile', style: TextStyle(fontSize: 15)),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
      // Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text('Drawer Header'),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(20),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text('Magic game 1', style: TextStyle(fontSize: 20)),
      //             SizedBox(height: 20),
      //             Text('Magic game 2', style: TextStyle(fontSize: 20)),
      //             SizedBox(height: 20),
      //             Text('Magic game 3', style: TextStyle(fontSize: 20)),
      //             SizedBox(height: 20),
      //             Text('Magic game 4', style: TextStyle(fontSize: 20)),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('NuMagic',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Text('App stater state', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
