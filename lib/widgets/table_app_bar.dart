import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:numagic/controllers/controllers.dart';
import 'package:provider/provider.dart';

class TableAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TableAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.1),
      iconTheme: const IconThemeData(color: Colors.white60),
      automaticallyImplyLeading: false,
      centerTitle: true,
      elevation: 10,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
          child: Container(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ),
      title: Builder(builder: (context) {
        return Text(
          "Table No. ${context.watch<TableController>().tableIndex + 1}",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white60,
          ),
        );
      }),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 75, left: 25),
          child: Transform.scale(
            scale: 1.5,
            child: Builder(builder: (context) {
              final tableIndex = context.watch<TableController>().tableIndex;
              return Checkbox(
                side: const BorderSide(color: Colors.white60, width: 2),
                activeColor: Colors.white60,
                checkColor: const Color(0xFF2F3857),
                value:
                    context.watch<AppBarController>().getCheckbox(tableIndex),
                onChanged: (value) => context
                    .read<AppBarController>()
                    .setCheckbox(tableIndex, value!),
              );
            }),
          ),
        ),
      ],
    );
  }
}
