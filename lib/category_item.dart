import 'package:flutter/material.dart';
import 'package:mealsapp/meals.dart';

class CgItem extends StatelessWidget {

  final String id;
  final Color color;
  final String title;

  CgItem({this.id, this.title, this.color});

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).pushNamed('/meals', arguments: {
      'cgId': id,
      'cgTitle': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(
            title,
        style: Theme.of(context).textTheme.headline6,),
      ),
    );
  }
}