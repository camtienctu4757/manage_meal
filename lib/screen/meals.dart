import 'package:flutter/material.dart';
import 'package:app_meals/models/meal.dart';
import 'package:app_meals/widget/meal_item.dart';
import 'package:app_meals/screen/detailmeal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  void onTapMeal(BuildContext context, Meal item) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => DetailScreen(
          meal: item,

        ),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh.....nothing here',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Select another category',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onselectedMeal: (meal) {
                  onTapMeal(context, meal);
                },
              ));
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
