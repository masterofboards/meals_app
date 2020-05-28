import 'package:flutter/material.dart';

import './categories.dart';
import './favorites.dart';
import './drawer.dart';
import './recipe_model.dart';

class Tabs extends StatefulWidget {

  final List<Recipes> favoriteMeals;
  Tabs(this.favoriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Widget> _pages;
  int _pageNumber = 0;

  @override
  void initState() {
    _pages = [
    Categories(),
    Favorites(widget.favoriteMeals),
  ];
    // TODO: implement initState
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      _pageNumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body: _pages[_pageNumber],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _pageNumber,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
