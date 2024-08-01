import 'package:app_meals/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(context, WidgetRef ref) {
    final favoriteMealList = ref.watch(favoriteProvider);
    final isFavorite = favoriteMealList.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdd =
                  ref.read(favoriteProvider.notifier).toggleStar(meal);
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      isAdd ? "Add your favorite" : "Remove your favorite")));
            },
            icon: Icon(isFavorite?Icons.star:Icons.star_border),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(meal.imageUrl),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Ingredient',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 8,
          ),
          for (var ingredient in meal.ingredients)
            Text(ingredient,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white)),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Steps',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          for (var step in meal.steps)
            Text(
              step,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontSize: 15),
            ),
        ],
      )),
    );
  }
}
