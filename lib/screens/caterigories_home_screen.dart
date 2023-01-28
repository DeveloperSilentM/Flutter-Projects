import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../dummy_DB.dart';

class CategoriesHomeScreen extends StatelessWidget {
  const CategoriesHomeScreen({super.key});

  //static const routename = 'categories-home';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories
          .map(
            (categoryItem) => CategoryItem(
              title: categoryItem.title,
              color: categoryItem.color,
              id: categoryItem.id,
            ),
          )
          .toList(),
    );
  }
}
