import 'package:Meals_app/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  Widget buildSection(String text, BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        ));
  }
final Function addFavorite;
  static const String routeName = '/MealDetail';
  final Function isMealFav;
  const MealDetail(this.addFavorite, this.isMealFav) ;
  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSection('Ingredians', context),
          buildListView(
            ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildSection('Steps', context),
          buildListView(ListView.builder(
            itemBuilder: (context, index) => Card(
              elevation: 4,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text((index + 1).toString()),
                ),
                title: Text(selectedMeal.steps[index]),
              ),
            ),
            itemCount: selectedMeal.steps.length,
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
           isMealFav(mealId)? Icons.favorite:Icons.favorite_border,
          ),
          onPressed: ()=>
        addFavorite(mealId)
          ),
    );
  }

  Container buildListView(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white10,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 200,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        width: 300,
        child: child);
  }
}
