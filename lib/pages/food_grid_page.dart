import 'package:flutter/material.dart';
import 'package:numagic/models/food.dart';
import 'package:numagic/pages/food_table_page.dart';
import 'package:numagic/pages/services/data_service.dart';
import 'package:numagic/widgets/widgets.dart';

class FoodGridPage extends StatelessWidget {
  const FoodGridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarMod(
        title: 'Choose Food',
        routeOnTap: () => const FoodTablePage(),
      ),
      body: TranslucentBackground(
        blurFilter: const [2, 2],
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 12,
        ),
        child: FutureBuilder<List<Food>>(
            future: DataService().fetchFoods(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                snapshot.data!.shuffle();
                return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return FoodCell(
                        flex: 1,
                        name: snapshot.data![index].name,
                        image: snapshot.data![index].image,
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }),
      ),
    );
  }
}
