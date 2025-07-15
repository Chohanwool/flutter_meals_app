import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

// 정적 Provider
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
