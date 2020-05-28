import 'package:flutter/material.dart';
import 'package:mealsapp/recipe_model.dart';
import 'recipe_details.dart';

class RpItem extends StatelessWidget {
  static const routeName = '/meals';

  final String id;
  final String title;
  final String imgUrl;
  final Complexity complexity;
  final int duration;
  final Cost cost;

  RpItem(
      {this.id,
      this.title,
      this.imgUrl,
      this.complexity,
      this.duration,
      this.cost});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.Cheap:
        return 'Cheap';
      case Cost.Moderate:
        return 'Moderate';
      case Cost.Expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void goToRpDetails(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(RpDetails.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToRpDetails(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imgUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: Container(
                      width: 200,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 5,
                        ),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 5,
                        ),
                        Text(complexityText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 5,
                        ),
                        Text(costText),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
