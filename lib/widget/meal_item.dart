import 'package:flutter/material.dart';
import 'package:app_meals/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:app_meals/widget/meal_item_train.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key,
   required this.meal,
   required this.onselectedMeal,
   
   });

  final Meal meal;

  final void Function(Meal meal) onselectedMeal;
  @override
  Widget build(context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onselectedMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow
                          .ellipsis, // dai hon 2 dong thi thanh dau ...
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ItemStrain(
                            icon: Icons.access_alarm,
                            lable: '${meal.duration.toString()} min',
                          ),
                          const Spacer(),
                          ItemStrain(
                            icon: Icons.work,
                            lable: meal.complexity.name,
                          ),
                          const Spacer(),
                          ItemStrain(
                            icon: Icons.price_change,
                            lable: meal.affordability.name,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
