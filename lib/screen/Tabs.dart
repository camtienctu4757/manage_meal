import 'package:app_meals/models/meal.dart';
import 'package:app_meals/provider/favorite_provider.dart';
import 'package:app_meals/provider/filter_provider.dart';
import 'package:app_meals/screen/categories.dart';
import 'package:app_meals/screen/filter.dart';
import 'package:app_meals/screen/meals.dart';
import 'package:app_meals/widget/maindraw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  var indexCurrentPage = 0;

  // tao ra danh sach de luu map cua filter
  // khoi tao la false

  void selectedTab(int index) {
    setState(() {
      indexCurrentPage = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filter') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    final favirites = ref.watch(favoriteProvider);
   
    // ap dung khi filter
    final List<Meal> avalableMeal = ref.watch(filterMealProvider);

    Widget activePage = CateroryScreen(
      mealsList: avalableMeal,
    );

    String activateTitle = 'Category';
    if (indexCurrentPage == 1) {
      activePage = MealScreen(
        meals: favirites,
      );
      activateTitle = 'Your Favorite';
    }
    return Scaffold(
      drawer: MainDraw(
        selectTitle: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activateTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexCurrentPage,
          onTap: (index) {
            selectedTab(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favotite'),
          ]),
    );
  }
}
