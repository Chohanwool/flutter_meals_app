import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // initial data set up by 생성자
  // super 에 initial data 전달, 제네릭 타입과 동일한 타입으로 전달
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    // StateNotifier 에서는 기존 객체의 수정 안됨
    // .remove, .add 안됨

    // 1. meal 이 즐겨찾기 리스트에 있는지 확인
    final mealsIsFavorite = state.contains(meal);

    // 2. 처리
    if (mealsIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

// 동적인 데이터를 다루는 경우 Provider 말고 StateNotifierProvider 사용
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
      return FavoriteMealsNotifier();
    });
