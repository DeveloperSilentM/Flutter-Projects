import 'package:flutter/material.dart';

class DurationItem extends StatelessWidget {
  final int duration;
  final IconData icon;
  const DurationItem({super.key, required this.duration, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(icon),
      const SizedBox(
        width: 6,
      ),
      Text('$duration min'),
    ]);
  }
}
