import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:numagic/models/models.dart';

class DataService {
  DataService._();
  factory DataService() => DataService._();

  Future<List<Food>> fetchFoods() async {
    final response =
        await rootBundle.loadString('assets/json/food_list.json', cache: true);
    return [for (var i in json.decode(response)) Food.fromJson(i)];
  }
}
