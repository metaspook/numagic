import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:numagic/utils/utils.dart';

class AppBarMod extends StatelessWidget with PreferredSizeWidget {
  AppBarMod({Key? key, required this.title, this.routeOnTap}) : super(key: key);
  final String title;
  Function? routeOnTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.1),
      iconTheme: const IconThemeData(color: Colors.white60),
      centerTitle: true,
      elevation: 10,
      title: Text(title,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white60)),
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ),
      actions: [
        if (routeOnTap != null)
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => routeOnTap!(),
                  ),
                );
                await Music().player.play(Music().audioClick);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.done_outline_rounded, size: 20),
                  Text(
                    'DONE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
