import 'package:Meals_app/models/Meal.dart';
import 'package:Meals_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CatMeals extends StatefulWidget {
  static const routeName = '/categoryMeals';
final List<Meal> myMeals;
  CatMeals(this.myMeals);

  @override
  _CatMealsState createState() => _CatMealsState();
}

class _CatMealsState extends State<CatMeals> {
  String catTitle;
  List<Meal> meals;
  var isLoaded =false;
  @override
  void didChangeDependencies () { 
    
  
if (!isLoaded){      final routArg =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final String catId = routArg['id'];
      catTitle = routArg['title'];
      meals = widget.myMeals.where((element) {
        return element.categories.contains(catId);
      }).toList();}
 isLoaded=true;
    
    super.didChangeDependencies ();

  }

  @override
  Widget build(BuildContext context) {
//   const CatMeals({Key key, this.catId, this.catTitle}) : super(key: key);
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: meals[index].title,
              imageUrl: meals[index].imageUrl,
              duration: meals[index].duration,
              complexity: meals[index].complexity,
              affordability: meals[index].affordability,
              id: meals[index].id,
            );
          },
          itemCount: meals.length,
        ));
  }

  removeItemHandler(String mealId) {
    setState(() {
      meals.removeWhere((element) => element.id == mealId);
    });
  }
}
