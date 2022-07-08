import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:numagic/controllers/controllers.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/pages/services/data_service.dart';
import 'package:numagic/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FoodTablePage extends StatelessWidget {
  const FoodTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TableAppBar(),
      floatingActionButton: const FloatingActionButtonBar(TableType.food),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: TranslucentBackground(
        blurFilter: const [2, 2],
        child: FutureBuilder<List<Food>>(
          future: DataService().fetchFoods(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 125, bottom: 25),
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
                        color: Colors.white30,
                        activeColor: Colors.white,
                      ),
                    ),
                    itemCount: tableController.foodTables.length,
                    itemBuilder: (context, index) {
                      return FoodTable(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemTable: tableController.foodTables.elementAt(index),
                        itemList: snapshot.data!,
                      );
                    },
                  );
                }),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
