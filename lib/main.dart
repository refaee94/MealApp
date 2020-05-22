import 'package:Meals_app/dummy_data.dart';
import 'package:Meals_app/models/Meal.dart';
import 'package:Meals_app/pages/FilterScreen.dart';
import 'package:Meals_app/pages/meal_detail.dart';
import 'package:flutter/material.dart';

import 'pages/Categories.dart';
import 'pages/Category_Meals.dart';
import 'pages/TABS.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false
  };

  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;

      myMeals = DUMMY_MEALS.where((meal) {
        if (filters['Gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (filters['Lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['Vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['Vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> myMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  void addFavorite(String mealId) {
    int element = favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (element >= 0) {
      setState(() {
              favoriteMeals.removeAt(element);

      });
    }else{setState(() {
    var favMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    favoriteMeals.add(favMeal);
      
    });}


  

  }

  @override
  Widget build(BuildContext context) {  bool isMealFav(String mealId){

      return favoriteMeals.any((element) => mealId==element.id);
    }

    return MaterialApp(
      initialRoute: '/',
      title: 'Flutter Demo',
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals),
        CatMeals.routeName: (ctx) => CatMeals(myMeals),
        MealDetail.routeName: (ctx) => MealDetail(addFavorite,isMealFav),
        FilterScreen.routeName: (_) => FilterScreen(setFilters, filters)
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
      theme: ThemeData(
          fontFamily: 'Raleway',
          accentColor: Colors.amber,
          primarySwatch: Colors.pink,
          canvasColor: Colors.blueGrey[50],
          textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.lightBlue),
              headline5: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
    );
  }
}
