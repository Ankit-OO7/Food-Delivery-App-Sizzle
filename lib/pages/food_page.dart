import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizzle/components/my_button.dart';
import '../models/food.dart';
import '../models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage ({
    super.key,
    required this.food,
  //  required this.selectedAddons,
  }){
    //initialize selected addons to be false
    for(Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold UI
        Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
            //food image
            //const SizedBox(height: 85),
            Image.asset(widget.food.imagePath),

            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 35, bottom: 25),
              child: Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children: [
                  //food name
                  Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                  ),

                  //food price
                  Text(
                    'Rs. '+widget.food.price.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 15),

                  //food description
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  const SizedBox(height: 35),

                  Divider(color: Theme.of(context).colorScheme.secondary,),
                  const SizedBox(height: 15),

                  Text(
                    "Add-ons",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  //addons
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {

                        //get individual addon
                        Addon addon = widget.food.availableAddons[index];

                        //return checkbox UI
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text('Rs.${addon.price}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

                //button -> add to cart
                MyButton(
                  onTap: () => addToCart(widget.food, widget.selectedAddons),
                  text: "Add to cart",
                ),
              //const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 15),
              decoration: BoxDecoration(
                //color: Colors.orange.shade100,
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                highlightColor: Colors.brown,
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}