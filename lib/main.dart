import 'package:flutter/material.dart';
import 'package:mealsapp/categories.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/meals.dart';
import 'package:mealsapp/recipe_details.dart';
import './tabs.dart';
import './filters.dart';
import './recipe_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filterButton = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Recipes> _availableMeals = DummyRecipes;
  List<Recipes> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filterButton = filterData;
      _availableMeals = DummyRecipes.where((element) {
        if (_filterButton['glutenFree'] && !element.isGlutenFree) {
          return false;
        }
        if (_filterButton['lactoseFree'] && !element.isLactoseFree) {
          return false;
        }
        if (_filterButton['vegan'] && !element.isVegan) {
          return false;
        }
        if (_filterButton['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if(existingIndex >=0){
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DummyRecipes.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.purple[100],
          canvasColor: Colors.grey[200],
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ))),

      //home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (_) => Tabs(_favoriteMeals),
        Meals.routeName: (_) => Meals(_availableMeals),
        RpDetails.routeName: (_) => RpDetails(_toggleFavorite, _isMealFavorite),
        Filters.routeName: (_) => Filters(_filterButton, _setFilters),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (ctx) =>
              Categories()), // Points to a default screen to display should all other pages fail to load.
    );
  }
}
