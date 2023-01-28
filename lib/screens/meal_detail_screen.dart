import 'package:flutter/material.dart';
import 'package:meals_app/dummy_DB.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.toggleFavorite, required this.isMealFavorite});
  static const routeName = 'meal-details';

  final dynamic toggleFavorite;
  final Function isMealFavorite;

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget contChild) {
    return Container(
      height: 200,
      width: 350,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: contChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dumyMeals.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.001),
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingedients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  // color: Theme.of(context).colorScheme.secondary,
                  color: const Color.fromARGB(255, 216, 187, 99),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                        horizontal: screenWidth * 0.009),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.001),
                  child: Wrap(
                    runSpacing: screenHeight * 0.00,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Wrap(
                              children: [
                                Text(
                                    '${index + 1}). ${selectedMeal.steps[index]}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 210, 206, 206),
                      ),
                    ],
                  ),
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
            isMealFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
