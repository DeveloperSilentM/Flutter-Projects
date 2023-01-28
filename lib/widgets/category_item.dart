import 'package:flutter/material.dart';
import '../screens/category_details_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

//Navigate to a new page when inkwell is selected
  void _selectCategory(BuildContext contx) {
    Navigator.of(contx).pushNamed(CategoryDetailsScreen.routeName,
        arguments: {'id': id, 'title': title}

        // MaterialPageRoute(
        //   builder: (_) {
        //     return CategoryDetailsScreen(categoryId: id, categoryTitle: title);
        //   },
        // ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.4), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
