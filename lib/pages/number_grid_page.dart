import 'package:flutter/material.dart';
import 'package:numagic/pages/number_table_page.dart';
import 'package:numagic/widgets/widgets.dart';

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
    final shortestSide = MediaQuery.of(context).size.shortestSide;

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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: shortestSide * 0.00275,
              ),
              itemCount: _numberList.length,
              itemBuilder: (context, index) {
                return NumberCell(index + 1);
              },
            ),
          ),
        ),
      ),
    );
  }
}
