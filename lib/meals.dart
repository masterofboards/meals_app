import 'package:flutter/material.dart';

import './recipe_model.dart';
import './recipe_item.dart';

class Meals extends StatefulWidget {
  static const routeName = '/meals';
  final List<Recipes> availableMeals;

  Meals(this.availableMeals);

  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  String categoryTitle;
  List<Recipes> displayedMeals;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
  ModalRoute.of(context).settings.arguments as Map<String, String>;
  final cgId = routeArgs['cgId'];
  categoryTitle = routeArgs['cgTitle'];
  displayedMeals = widget.availableMeals.where((element) {
    return element.belongsToCg.contains(cgId);
  }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (context, index) {
          return RpItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imgUrl: displayedMeals[index].imageUrl,
            complexity: displayedMeals[index].complexity,
            cost: displayedMeals[index].cost,
            duration: displayedMeals[index].duration,
          );
        },
      ),
    );
  }
}
