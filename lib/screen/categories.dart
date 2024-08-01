import 'package:app_meals/screen/meals.dart';
import 'package:flutter/material.dart';
import 'package:app_meals/data/dummy_data.dart';
import 'package:app_meals/widget/categories_grid_item.dart';
import 'package:app_meals/models/category.dart';
import 'package:app_meals/models/meal.dart';

class CateroryScreen extends StatelessWidget {
  const CateroryScreen({super.key,required this.mealsList});

  final List<Meal> mealsList;
  void _selectCategory(BuildContext context, Category category) {
    final resultList = mealsList
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MealScreen(
        title: category.title,
        meals: resultList,
      ),
    ));
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final cate in availableCategories)
            CategoryGridItem(
              category: cate,
              onSelected: () {
                _selectCategory(context, cate);
              },
            )
        ],
      ),
    );
  }
}
