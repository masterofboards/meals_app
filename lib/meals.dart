import 'package:flutter/material.dart';
import 'package:mealsapp/recipe_item.dart';

import './recipe_item.dart';
import 'dummy_data.dart';

class Meals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final cgId = routeArgs['cgId'];
    final cgTitle = routeArgs['cgTitle'];
    final filter = DummyRecipes.where((element) {
      return element.belongsToCg.contains(cgId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(cgTitle),
      ),
      body: ListView.builder(
        itemCount: filter.length,
        itemBuilder: (context, index) {
          return RpItem(
            title: filter[index].title,
            imgUrl: filter[index].imageUrl,
            complexity: filter[index].complexity,
            cost: filter[index].cost,
            duration: filter[index].duration,
          );
        },
      ),
    );
  }
}
