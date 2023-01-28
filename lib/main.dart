import 'package:flutter/material.dart';
import 'package:meals_app/dummy_DB.dart';
// import 'package:meals_app/screens/cats_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/category_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //managing the filters screen state
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };
  //initial meals as they are from the dumy_DB
  List<Meal> _availableMeals = dumyMeals;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      //override existing filters states
      _filters = filterData;

      //override existing meals based on filters
      _availableMeals = dumyMeals.where((meal) {
        // if (_filters['gluten']! && !meal.isGlutenFree) {
        //   return false;
        // }
        if (_filters['gluten'] != null && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['luctose'] != null && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] != null && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] != null && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(dumyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 206, 200, 200),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            bodyMedium: const TextStyle(color: Colors.black),
            titleMedium:
                const TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed')),
      ),
      // home: const CategoriesHomeScreen(),
      routes: {
        // CategoriesHomeScreen.routename: (context) =>
        //     const CategoriesHomeScreen(),
        '/': (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoryDetailsScreen.routeName: (context) =>
            CategoryDetailsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isMealFavorite: _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   // print(settings.arguments);
      //   // return MaterialPageRoute(
      //   //   builder: (contx) => const CategoriesHomeScreen(),
      //   // );
      // },
      //default fall back route
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (contx) => const CategoriesHomeScreen(),
      //   );
      // },
    );
  }
}
