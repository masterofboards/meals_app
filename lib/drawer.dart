import 'package:flutter/material.dart';
import 'package:mealsapp/filters.dart';

class MyDrawer extends StatelessWidget {
  Widget listTileWidget(
      String text, IconData icon, BuildContext context, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Time',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          listTileWidget('Meals', Icons.restaurant, context, () {
            Navigator.of(context).pushNamed('/');
          }),
          SizedBox(
            height: 20,
          ),
          listTileWidget('Filters', Icons.settings, context, () {
            Navigator.of(context).pushReplacementNamed(Filters.routeName);
          }),
        ],
      ),
    );
  }
}
