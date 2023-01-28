import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem({super.key});

  Widget buildListTileItem(
      IconData icon, String titleText, VoidCallback fxnHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        titleText,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
      ),
      onTap: fxnHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Cooking App',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Color.fromARGB(255, 205, 54, 104)),
              ),
            ),
          ),
          buildListTileItem(Icons.restaurant, 'Meals', () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTileItem(Icons.settings, 'Settings', () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
