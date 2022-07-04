import 'package:flutter/material.dart';
import 'package:numagic/pages/number_table_page.dart';
import 'package:numagic/utils/methods.dart';
import 'package:numagic/widgets/appbar_mod.dart';
import 'package:numagic/widgets/translucent_background.dart';

class NumberGridPage extends StatefulWidget {
  const NumberGridPage({Key? key}) : super(key: key);

  @override
  State<NumberGridPage> createState() => _NumberGridPageState();
}

class _NumberGridPageState extends State<NumberGridPage> {
  final List<int> _numberList =
      List.generate(63, (index) => index, growable: false);

  @override
  Widget build(BuildContext context) {
    _numberList.shuffle();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarMod(
        title: 'Choose Number',
        routeOnTap: () => const NumberTablePage(),
      ),
      body: TranslucentBackground(
        blurFilter: const [2, 2],
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 12,
            ),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
              ),
              itemCount: _numberList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "${_numberList[index] + 1}",
                      style: TextStyle(
                        color: Methods().colorPrimariesRandomIndex(index),
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
