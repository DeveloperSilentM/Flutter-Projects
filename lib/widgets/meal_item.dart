import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/duration_item.dart';
import 'package:meals_app/widgets/string_row_item.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  //final Function removeItem;

  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    //required this.removeItem
  });

  String get getComplexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.hard:
        return 'Hard';
      case Complexity.challenging:
        return 'Challenging';
      default:
        return 'Unknown';
    }
  }

  String get getAffordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void _selectMeal(BuildContext context) {
    Navigator.pushNamed(context, MealDetailScreen.routeName, arguments: id);
    // .then((result) => {
    //       if (result != null)
    //         {
    //           removeItem(result),
    //         }
    //     });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 15,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 250,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(137, 109, 105, 105),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 26),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DurationItem(duration: duration, icon: Icons.schedule),
                  StringRowIteam(
                      itemIcon: Icons.work, itemText: getComplexityText),
                  StringRowIteam(
                      itemIcon: Icons.money_sharp,
                      itemText: getAffordabilityText)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
