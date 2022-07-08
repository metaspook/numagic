import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:numagic/controllers/controllers.dart';
import 'package:numagic/utils/utils.dart';
import 'package:numagic/widgets/widgets.dart';
import 'package:provider/provider.dart';

class NumberTablePage extends StatelessWidget {
  const NumberTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TableAppBar(),
      floatingActionButton: const FloatingActionButtonBar(TableType.number),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: TranslucentBackground(
        blurFilter: const [2, 2],
        child: Column(
          children: <Widget>[
            const SizedBox(height: kToolbarHeight * 1.25),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Builder(builder: (context) {
                  final tableController = context.read<TableController>();
                  return Swiper(
                    index: context.watch<TableController>().tableIndex,
                    onIndexChanged: (index) =>
                        tableController.setTableIndex(index),
                    control: const SwiperControl(
                        padding: EdgeInsets.only(left: 10),
                        size: 40,
                        color: Colors.white60),
                    pagination: const SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.white30, activeColor: Colors.white),
                    ),
                    itemCount: tableController.numberTables.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 50),
                        child: NumberTable(
                          itemTable:
                              tableController.numberTables.elementAt(index),
                          itemList: Methods().numberList,
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
