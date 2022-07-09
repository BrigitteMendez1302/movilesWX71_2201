import 'package:http/http.dart' as http;
import 'package:final_moviles/models/category.dart';
import 'package:final_moviles/models/meal.dart';
import 'dart:convert';
import 'dart:io';

class HttpHelper {
  // https://www.themealdb.com/api/json/v2/9973533/filter.php?c=Chicken
  final String urlBaseCategories = 'https://www.themealdb.com/api/json/v2/9973533/categories.php';
  final String urlBaseMeals = 'https://www.themealdb.com/api/json/v2/9973533/filter.php?c=';

  Future<List<Category>> getCategories() async{
    final String upcoming = urlBaseCategories;
    print(upcoming);
    http.Response result = await http.get(Uri.parse(upcoming));

    if(result.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(result.body);
      final categoriesMap = jsonResponse['categories'];

      List<Category> categories = categoriesMap.map<Category>((i) =>
          Category.fromJson(i)).toList();

      return categories;
    }else{
      print(result.body);
      return null!;
    }
  }

  Future<List<Meal>> getMealsByCategory(String text) async{
    final String upcoming = urlBaseMeals+text;
    print(upcoming);
    http.Response result = await http.get(Uri.parse(upcoming));

    if(result.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(result.body);
      final mealsMap = jsonResponse['meals'];

      List<Meal> meals = mealsMap.map<Meal>((i) =>
          Meal.fromJson(i)).toList();

      return meals;
    }else{
      print(result.body);
      return null!;
    }
  }
}