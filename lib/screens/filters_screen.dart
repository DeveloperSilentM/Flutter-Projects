import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer_item.dart';
import 'package:meals_app/widgets/switch_list-item.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters, {super.key});

  static const routeName = 'filters-screen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  @override
  void initState() {
    if (widget.currentFilters['gluten'] != null) {
      _glutenFree = widget.currentFilters['gluten']!;
    }
    if (widget.currentFilters['lactose'] != null) {
      _glutenFree = widget.currentFilters['lactose']!;
    }
    if (widget.currentFilters['vegan'] != null) {
      _glutenFree = widget.currentFilters['vegan']!;
    }
    if (widget.currentFilters['vegeterian'] != null) {
      _glutenFree = widget.currentFilters['vegeterian']!;
    }
    // _lactoseFree = widget.currentFilters['lactose']!;
    // _vegan = widget.currentFilters['vegan']!;
    // _vegeterian = widget.currentFilters['vegeterian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegtarian': _vegeterian,
                };
                widget.saveFilters(selectedFilters);
                // print(selectedFilters);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        drawer: const MainDrawerItem(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListItem(
                      titleText: 'Gluten-free',
                      descriptionText: 'Only select gluten free meals',
                      currentSwitchValue: _glutenFree,
                      updateValFxn: (currentValue) {
                        setState(() {
                          _glutenFree = currentValue;
                        });
                      }),
                  SwitchListItem(
                      titleText: 'Lactose-free',
                      descriptionText: 'Only select lactose free meals',
                      currentSwitchValue: _lactoseFree,
                      updateValFxn: (currentValue) {
                        setState(() {
                          _lactoseFree = currentValue;
                        });
                      }),
                  SwitchListItem(
                      titleText: 'Vegan',
                      descriptionText: 'Only select vegan  meals',
                      currentSwitchValue: _vegan,
                      updateValFxn: (currentValue) {
                        setState(() {
                          _vegan = currentValue;
                        });
                      }),
                  SwitchListItem(
                      titleText: 'Vegatarian',
                      descriptionText: 'Only select vegtarian meals',
                      currentSwitchValue: _vegeterian,
                      updateValFxn: (currentValue) {
                        setState(() {
                          _vegeterian = currentValue;
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
