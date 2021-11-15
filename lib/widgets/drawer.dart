import 'package:flutter/material.dart';
import 'package:numagic/widgets/custom_divider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 255,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            // Drawer Header
            const SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/maxresdefault.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text('NuMagic',
                      style: TextStyle(
                          fontSize: 45,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
            ),
            Center(
              child: Text('The magic of numbers',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[700],
                  )),
            ),
            const SizedBox(height: 8),
            CustomDivider(),
            const SizedBox(height: 20),
            // Drawer Body
            const ListTile(
              leading: Icon(Icons.history),
              title: Text('History', style: TextStyle(fontSize: 15)),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Visit Profile', style: TextStyle(fontSize: 15)),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('About', style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
