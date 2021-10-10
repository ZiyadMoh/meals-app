import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/meal-detail';

  final Function toggoleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggoleFavorite, this.isFavorite);

  Widget buildSectionTitle(String txt, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        txt,
        style: Theme.of(ctx).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => mealId == element.id);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingredients', context),
              buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index])),
                  ),
                ),
              ),
              buildSectionTitle('Steps', context),
              buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => toggoleFavorite(mealId),
          child:
              isFavorite(mealId) ? Icon(Icons.star) : Icon(Icons.star_border),
        ));
  }
}
