// ignore: file_names

import 'package:flutter/material.dart';

class SwitchListItem extends StatelessWidget {
  const SwitchListItem(
      {super.key,
      required this.titleText,
      required this.descriptionText,
      required this.currentSwitchValue,
      required this.updateValFxn});
  final String titleText;
  final String descriptionText;
  final bool currentSwitchValue;
  final dynamic updateValFxn;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(titleText),
      value: currentSwitchValue,
      onChanged: updateValFxn,
      subtitle: Text(descriptionText),
    );
  }
}
