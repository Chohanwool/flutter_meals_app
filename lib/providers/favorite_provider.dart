import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  // 상태 변경 메서드 : 즐겨 찾기 추가/제거
  bool toggleMealFavoriteStatus(Meal meal) {
    /**
     * state
     * - 값 : 현재 즐겨찾기 된 Meal 객체들의 List
     * - 타입 : List<Meal>
     */
    final isFavorite = state.contains(meal);

    // 상태 변경 시에는 불변성을 보장 해줘야함
    // 불변성 보장 -> 새 리스트 반환
    if (isFavorite) {
      // 제거
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // 추가
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
      (ref) => FavoriteMealsNotifier(),
    );
