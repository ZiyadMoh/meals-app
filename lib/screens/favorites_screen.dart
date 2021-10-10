import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../Widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoritesMeals;
  FavoriteScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeals[index].id,
            title: favoritesMeals[index].title,
            imgUrl: favoritesMeals[index].imageUrl,
            duration: favoritesMeals[index].duration,
            complexity: favoritesMeals[index].complexity,
            affordability: favoritesMeals[index].affordability,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  }
}
