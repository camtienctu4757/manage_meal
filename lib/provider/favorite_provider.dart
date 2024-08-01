import 'package:app_meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends StateNotifier<List<Meal>> {
  FavoriteNotifier() : super([]);

  bool toggleStar(Meal meal) {
    final isInclude = state.contains(meal);
    if (!isInclude) {
      state = [...state, meal];
      return true;
    } else {
      state = state.where((item) => item.id != meal.id).toList();
      return false;
    }
  }
}

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, List<Meal>>((ref) {
  return FavoriteNotifier();
});
