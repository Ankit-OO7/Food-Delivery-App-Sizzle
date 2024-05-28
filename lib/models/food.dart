// import 'package:flutter/material.dart';
//
// class Food extends StatelessWidget {
//   const Food ({super.key});
//
//   @override
//   Widget build (BuildContext context) {
//     return Scaffold();
//   }
// }

//food item
class Food {
  final String name;         // cheese burger
  final String description;  // a burger full of cheese
  final String imagePath;    // lib/images/cheese_burger.png
  final double price;        // 200
  final FoodCategory category; // burger
  List<Addon> availableAddons;  // extra cheese, sauce, patty

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//food categories
enum FoodCategory {
  Burgers,
  Salads,
  Sides,
  Desserts,
  Drinks,
}

//food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price
  });
}