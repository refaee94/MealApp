import 'package:Meals_app/widgets/DrawerMenu.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function filterFun;
  final Map<String, bool> filters;
  const FilterScreen(this.filterFun, this.filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  @override
  void initState() {
    isGlutenFree = widget.filters['Gluten'];
    isLactoseFree = widget.filters['Lactose'];
    isVegan = widget.filters['Vegan'];
    isVegetarian = widget.filters['Vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  widget.filterFun({
                    'Gluten': isGlutenFree,
                    'Lactose': isLactoseFree,
                    'Vegan': isVegan,
                    'Vegetarian': isVegetarian
                  });
                })
          ],
          title: Text('Filters'),
        ),
        drawer: DrawerMenu(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'data',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                buildSwitchListTile(isGlutenFree, 'Gluten Free', (newVal) {
                  setState(() {
                    isGlutenFree = newVal;
                  });
                }),
                buildSwitchListTile(isLactoseFree, 'Lactose Free', (newVal) {
                  setState(() {
                    isLactoseFree = newVal;
                  });
                }),
                buildSwitchListTile(isVegan, 'Vegan', (newVal) {
                  setState(() {
                    isVegan = newVal;
                  });
                }),
                buildSwitchListTile(isVegetarian, 'Vegetarian', (newVal) {
                  setState(() {
                    isVegetarian = newVal;
                  });
                })
              ],
            ))
          ],
        ));
  }

  SwitchListTile buildSwitchListTile(
      bool oldValue, String text, Function updater) {
    return SwitchListTile(
        title: Text(text), value: oldValue, onChanged: updater);
  }
}
