import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class Categories extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: DummyCategories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (buildContext, e) {
            return CgItem(
              color: DummyCategories[e].color,
              title: DummyCategories[e].title,
              id: DummyCategories[e].id,
            );
          },
        ),
    );
  }
}
