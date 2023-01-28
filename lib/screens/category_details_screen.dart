import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

// ignore: must_be_immutable
class CategoryDetailsScreen extends StatefulWidget {
  CategoryDetailsScreen({super.key, required this.availableMeals});
  static const routeName = 'category-details';

  List<Meal> availableMeals;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  String? categoryTitle;
  late List<Meal> displayedMeals;
  bool _loadedIniData = false;

  @override
  void initState() {
    //.....do not run context args
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedIniData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      displayedMeals = widget.availableMeals.where((mealItem) {
        return mealItem.categories.contains(categoryId);
      }).toList();
      _loadedIniData = true;
    }

    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.where((meal) => meal.id == mealId);
  //   });
  // }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    //accept route arguments sent from categeory item

    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Details'),
      ),
      body: ListView.builder(
        itemBuilder: (contx, index) {
          return MealItem(
              //removeItem: _removeMeal,
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
