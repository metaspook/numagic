import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:numagic/pages/food_table_page.dart';

class AppBarMod extends StatelessWidget with PreferredSizeWidget {
// class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarMod({Key? key, required this.title, this.routeOnTap}) : super(key: key);
  final String title;
  Function? routeOnTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // onTap = () => Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => FoodTablePage()));
    return AppBar(
      // toolbarOpacity: 0.9,
      // bottomOpacity: 0.1,
      // actionsIconTheme: const IconThemeData(color: Colors.white60),
      actions: [
        if (routeOnTap != null)
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => routeOnTap!(),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.done_outline_rounded,
                    size: 20,
                  ),
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
      // automaticallyImplyLeading: false,
      // shadowColor: Colors.black,
      backgroundColor: Colors.black.withOpacity(0.1),
      // backgroundColor: Colors.white.withOpacity(0.1),
      // backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white60),
      centerTitle: true,
      elevation: 10,
      title: Text(title,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white60)),
      // systemOverlayStyle: SystemUiOverlayStyle.light,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color: Colors.white.withOpacity(0.1),
            // color: Colors.black.withOpacity(0.1),
            // color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

  // @Deprecated(
  //   'This property is no longer used, please use toolbarTextStyle and titleTextStyle instead. '
  //   'This feature was deprecated after v2.4.0-0.0.pre.',
  // )
  // final TextTheme? textTheme;
