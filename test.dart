import 'dart:async';
import 'dart:io';

String fruits = """
Apple
Biscuit
Boiled-Egg
Bread
Breadsticks
Breakfast-Sandwich
Burger
Butter
Candies
Cheese
Cheeseburger
Chips
Chocolate
Chocolate-Milk
Coconut-Milk
Coffee
Cookies
Croissant
Donut
Fish
French-bread
Fried-chicken
Fries
Fruit-Juice
Fruits
Grape
Green-Tea
Honey
Hot-chocolate
Hot-dog
Ice-cream
Jam
Kebab
Lemonade
Meat
Milk
Milk-shake
Muffin
Noodle
Omelet
Orange-juice
Pancake
Pasta
Pizza
Rice
Roast-chicken
Roll
Salad
Sandwich
Sausage
Seafood
Soft-drink
Soup
Steak
Taco
Tea
Vegetables
Water
Watermelon
Yogurt""";
List fruit_list = fruits.split('\n');

var num_list = [for (var i = 1; i < 60; i += 1) i];
var dir = Directory('assets/images/foods/');
Stream<FileSystemEntity> fileList =
    dir.list(recursive: true, followLinks: false);

Future<void> main() async {
  List imageList = [
    await for (FileSystemEntity entity in fileList) entity.path
  ];
  var out = File('output.json').openWrite();
  // print(fruit_list);
  String fullMap = "";
  for (var i = 0; i < fruit_list.length; i += 1) {
    fullMap += """
{
  "id": ${i + 1},
  "name": "${fruit_list[i]}",
  "image": "${imageList[i]}"
},
""";
// out.write("String written to file.\n");
  }
  out.write("""[
  $fullMap
  ]""");
  out.close();

  // if (await dir.exists()) {

  // print(await dir.list(recursive: false, followLinks: true).toList());

  // print(entityList);
  // out.write("String written to file.\n");
}
