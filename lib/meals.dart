import 'package:flutter/material.dart';

class Meals extends StatelessWidget {

  //final String id;
  //final String title;

  //Meals({this.id, this.title});

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final cgId = routeArgs['cgId'];
    final cgTitle = routeArgs['cgTitle'];

    return Scaffold(
      appBar: AppBar(
        title: Text(cgTitle),
      ),
      body: Text('some text'),
    );
  }
}
