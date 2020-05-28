import 'dart:ffi';

import 'package:flutter/material.dart';
import './dummy_data.dart';

class RpDetails extends StatelessWidget {
  static const routeName = '/recipe_details';

  final Function toggleFavorite;
  final Function isFavorite;
  RpDetails(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildListView(BuildContext context, element) {
    return Container(
      height: 150,
        width: 300,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView.builder(
            itemCount: element.length,
            itemBuilder: (ctx, e) {
              return Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: Text(element[e]),
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DummyRecipes.firstWhere((element) => element.id == mealId);

    return Scaffold(
            appBar: AppBar(
              title: Text(selectedMeal.title),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      selectedMeal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  buildSectionTitle(context, 'Ingredients'),
                  buildListView(context, selectedMeal.ingredients),
                  buildSectionTitle(context, 'Steps'),
                  buildListView(context, selectedMeal.steps),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.favorite : Icons.favorite_border
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
