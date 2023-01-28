import 'package:flutter/material.dart';

class StringRowIteam extends StatelessWidget {
  final String itemText;
  final IconData itemIcon;
  const StringRowIteam(
      {super.key, required this.itemIcon, required this.itemText});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(itemIcon),
      const SizedBox(
        width: 6,
      ),
      Text(itemText),
    ]);
  }
}
