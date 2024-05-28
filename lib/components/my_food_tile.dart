import 'package:flutter/material.dart';
import '../models/food.dart';


class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile ({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       GestureDetector(
         onTap: onTap,
         child: Padding(
           padding: const EdgeInsets.only(top: 20, bottom: 8,left: 15,right: 10),
           child: Row(
             children: [
               //text food details
               Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         food.name,
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Text(
                         'Rs. '+food.price.toString(),
                         style: TextStyle(
                           color: Theme.of(context).colorScheme.primary,
                         ),
                       ),
                       const SizedBox(height: 18),
                       Text(
                         food.description,
                         style: TextStyle(
                           color: Theme.of(context).colorScheme.inversePrimary,
                         ),
                       ),
                     ],
                   ),
               ),



               //food image
               Padding(
                 padding: const EdgeInsets.all(5.0),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: Image.asset(food.imagePath, height: 90),
                 ),
               )
             ],
           ),
         ),
       ),
       Divider(
         color: Theme.of(context).colorScheme.tertiary,
         endIndent: 25,
         indent: 25,
       ),
     ],
   );
  }
}