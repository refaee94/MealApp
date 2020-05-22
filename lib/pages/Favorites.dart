import 'package:Meals_app/models/Meal.dart';
import 'package:Meals_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const Favorites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: favoriteMeals.isEmpty? Center(child: Text('Favorites'),):
      ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
              id: favoriteMeals[index].id,
            );
          },
          itemCount: favoriteMeals.length,
        ),
    );
  }
}