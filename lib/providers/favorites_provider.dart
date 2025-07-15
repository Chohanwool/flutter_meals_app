
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends ChangeNotifier {
  List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => _favoriteMeals;

  bool isMealFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  void toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
    notifyListeners();
  }
}
