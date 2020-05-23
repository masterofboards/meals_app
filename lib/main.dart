import 'package:flutter/material.dart';
import 'package:mealsapp/categories.dart';
import 'package:mealsapp/meals.dart';

import './category_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      accentColor: Colors.yellow[700],
      canvasColor: Colors.grey[200],
      textTheme: ThemeData.light().textTheme.copyWith(
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        )
      )),

      home: Categories(),
      routes: {
        '/meals':(ctx) => Meals(),
      },
    );
  }
}
