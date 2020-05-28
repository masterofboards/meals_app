import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = 'filters';
  final Function setFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.setFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['glutenFree'];
    _isLactoseFree = widget.currentFilters['lactoseFree'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _isVegan = widget.currentFilters['vegan'];
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchListTile(String title, bool filterValue, String subtitle, Function setState) {
    return SwitchListTile(
      title: Text(title),
      value: filterValue,
      subtitle: Text(subtitle),
      onChanged: setState,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'glutenFree': _isGlutenFree,
                  'lactoseFree': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.setFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                'Please select your filtres:',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten free', _isGlutenFree,
                      'Only include gluten-free meals.', (newValue) {
                      setState(() {
                        _isGlutenFree = newValue;
                      });
                    },),
                  _buildSwitchListTile('Lactose free', _isLactoseFree,
                      'Only include lactose-free meals.', (newValue) {
                      setState(() {
                        _isLactoseFree = newValue;
                      });
                    },),
                  _buildSwitchListTile('Vegetarian', _isVegetarian,
                      'Only inlclude vegetarian meals.', (newValue) {
                      setState(() {
                        _isVegetarian = newValue;
                      });
                    },),
                  _buildSwitchListTile(
                      'Vegan', _isVegan, 'Only include vegan meals.', (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
