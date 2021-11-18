import 'package:numagic/pages/food_table.dart';
import 'package:numagic/pages/home.dart';
import 'package:numagic/pages/hidden_digit_1.dart';
import 'package:numagic/pages/hidden_number_1.dart';
import 'package:numagic/pages/number_table.dart';
import 'package:velocity_x/velocity_x.dart'; // Named Routes.

final VxNavigator navigator = VxNavigator(routes: {
  "/": (uri, param) => VxRoutePage(
        fullscreenDialog: true,
        pageName: "HomePage",
        child: const HomePage(),
      ),
  "/number_table": (uri, param) => VxRoutePage(
        fullscreenDialog: true,
        pageName: "number_table",
        child: const NumberTable(),
      ),
  "/food_table": (uri, param) => VxRoutePage(
        fullscreenDialog: true,
        pageName: "food_table",
        child: const FoodTable(),
      ),
  "/hidden_digit": (uri, param) => VxRoutePage(
        fullscreenDialog: true,
        pageName: "hidden_digit",
        child: const HiddenDigit1(),
      ),
  "/hidden_number": (uri, param) => VxRoutePage(
        fullscreenDialog: true,
        pageName: "hidden_number",
        child: const HiddenNumber1(),
      ),
});
