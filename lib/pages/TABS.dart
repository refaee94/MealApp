import 'package:Meals_app/models/Meal.dart';
import 'package:Meals_app/pages/Categories.dart';
import 'package:Meals_app/widgets/DrawerMenu.dart';
import 'package:flutter/material.dart';

import 'Favorites.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<TabsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(drawer: DrawerMenu(),
        appBar: AppBar(
          title: Text('Meal'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.menu),
              text: 'Categories',
            ),
            Tab(icon: Icon(Icons.star), text: 'Favorites')
          ]),
        ),
        body: TabBarView(children: <Widget>[Categories(), Favorites(widget.favoriteMeals)]),
      ),
    );
  }
}


