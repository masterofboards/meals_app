import 'package:flutter/material.dart';
import './recipe_model.dart';
import './recipe_item.dart';

class Favorites extends StatelessWidget {

  final List<Recipes> favoriteMeals;
  Favorites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Text('You have no favorites yet!');
    } else{
      return
      ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return RpItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imgUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].complexity,
            cost: favoriteMeals[index].cost,
            duration: favoriteMeals[index].duration,
          );
        },
      );
    }

  }
}
