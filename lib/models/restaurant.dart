import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';
import 'food.dart';
import 'package:flutter/material.dart';

class Restaurant extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Hamburger",
      description:
      "A juicy beef patty with melted cheddar, lettuce, and a hint of onion and pickle.",
      imagePath: "lib/images/burgers/ham_burger.png",
      price: 49,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 12),
        Addon(name: "Roasted Mushroom", price: 15),
        Addon(name: "Grilled onions", price: 9),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
        "A juicy veggie patty with melted cheddar, lettuce, and a hint of onion and pickle.",
      imagePath: "lib/images/burgers/cbacon_burger.png",
      price: 55,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "American Cheese", price: 14),
        Addon(name: "Fried Egg", price: 12),
        Addon(name: "Avocado", price: 29),
      ],
    ),
    Food(
      name: "Crispy burger",
      description:
      "A crispy chicken patty with fresh lettuce, tangy mayo, and a hint of pickle.",
      imagePath: "lib/images/burgers/crspy_burger.png",
      price: 61,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Feta Sauce", price: 12),
        Addon(name: "Bacon", price: 16),
        Addon(name: "Spicy mayo", price: 9),
      ],
    ),
    Food(
      name: "Pounder burger",
      description:
      "Layered with two slices of melty American cheese, creamy mayo, slivered onions and tangy pickles on a soft.",
      imagePath: "lib/images/burgers/pounde_burger.png",
      price: 79,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "BBQ Sauce", price: 24),
        Addon(name: "Bacon", price: 16),
        Addon(name: "Guacamole", price: 29),
      ],
    ),
    Food(
      name: "Big Mac burger",
      description:
      "Double beef patties with special sauce, crisp lettuce, melty cheese, pickles, and onions.",
      imagePath: "lib/images/burgers/bigmac_burger.png",
      price: 99,
      category: FoodCategory.Burgers,
      availableAddons: [
        Addon(name: "Tzatziki", price: 25),
        Addon(name: "Bacon", price: 16),
        Addon(name: "Extra special sauce", price: 20),
      ],
    ),

    //salads
    Food(
      name: "Side Salad",
      description:
      "A simple side salad with crisp lettuce, cherry tomatoes, and your choice of dressing.",
      imagePath: "lib/images/salads/sidesalad_salads.png",
      price: 69,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Crispy bacon bits", price: 39),
        Addon(name: "Sliced avocado", price: 19),
        Addon(name: "Shredded cheddar cheese", price: 14),
      ],
    ),
    Food(
      name: "Crispy Salad",
      description:
      "A crunchy salad mix with your choice of crispy or grilled chicken, topped with zesty vinaigrette.",
      imagePath: "lib/images/salads/crspy_salads.png",
      price: 79,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Jalapenos", price: 29),
        Addon(name: "Sliced avocado", price: 19),
        Addon(name: "Shredded cheddar cheese", price: 14),
      ],
    ),
    Food(
      name: "Grilled Chicken Salad",
      description:
      "A fresh salad with grilled chicken, crunchy vegetables, and zesty vinaigrette.",
      imagePath: "lib/images/salads/grlchick_salads.png",
      price: 79,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Crispy bacon bits", price: 39),
        Addon(name: "Lettuce", price: 14),
        Addon(name: "Diet-cheese", price: 19),
      ],
    ),
    Food(
      name: "BBQ Chicken Salad",
      description:
      "A hearty salad featuring grilled chicken, crispy bacon bits, fresh veggies, and zesty vinaigrette.",
      imagePath: "lib/images/salads/beacon_salads.png",
      price: 109,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 19),
        Addon(name: "Special Sauce", price: 9),
        Addon(name: "Feta Sauce", price: 14),
      ],
    ),
    Food(
      name: "Smokey Grilled Salad",
      description:
      "A hearty salad featuring grilled chicken, crispy bacon bits, fresh veggies, and zesty vinaigrette.",
      imagePath: "lib/images/salads/grlchick_sides.png",
      price: 79,
      category: FoodCategory.Salads,
      availableAddons: [
        Addon(name: "Roasted Red Peppers", price: 8),
        Addon(name: "Toasted nuts", price: 25),
        Addon(name: "Crumbled Feta cheese", price: 14),
      ],
    ),

    //sides
    Food(
      name: "French fries",
      description:
      "Grab our World Famous Fries and pair them with one of our burgers.",
      imagePath: "lib/images/sides/fries+sides.png",
      price: 59,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 25),
        Addon(name: "Bacon bits", price: 16),
        Addon(name: "Truffle oil", price: 29),
      ],
    ),
    Food(
      name: "Veggie dippers",
      description:
      "A tasty blend of red pepper and sundried tomato pesto, all coated in crispy golden breadcrumbs.",
      imagePath: "lib/images/sides/dippers+sides.png",
      price: 109,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Hummus", price: 15),
        Addon(name: "Ranch Dressing", price: 24),
        Addon(name: "Guacamole", price: 25),
      ],
    ),
    Food(
      name: "Chicken nuggets",
      description:
      "Made with 100% chicken breast meat in a deliciously crispy coating, just waiting to be dipped. ",
      imagePath: "lib/images/sides/40chk_sides.png",
      price: 129,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Tzatziki", price: 25),
        Addon(name: "BBQ Sauce", price: 25),
        Addon(name: "Honey Mustard", price: 25),
      ],
    ),
    Food(
      name: "Spicy veggie wrap",
      description:
      "Tasty veggie dippers with spicy relish, crisp lettuce, red onion and tomato, all wrapped up in a soft, toasted tortilla wrap.",
      imagePath: "lib/images/sides/veggie_sides.png",
      price: 79,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Feta cheese", price: 10),
        Addon(name: "Hummus Spread", price: 15),
        Addon(name: "Avocado Slices", price: 25),
      ],
    ),
    Food(
      name: "Grill-chicken wrap",
      description:
      "crispy chicken breast with a sweet chilli sauce, cool mayo, lettuce and cucumber in a soft, toasted tortilla wrap.",
      imagePath: "lib/images/sides/chilli_sides.png",
      price: 109,
      category: FoodCategory.Sides,
      availableAddons: [
        Addon(name: "Cheddar Cheese", price: 15),
        Addon(name: "Bacon Bits", price: 25),
        Addon(name: "Chipotle Sauce", price: 22),
      ],
    ),

    //desserts
    Food(
      name: "Vanilla cone",
      description:
      "Our Vanilla Cone features creamy vanilla soft serve in a crispy cone.",
      imagePath: "lib/images/desserts/cone_dessert.png",
      price: 29,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Sprinkles", price: 9),
        Addon(name: "Crushed Nuts", price: 26),
        Addon(name: "Chocolate Dip", price: 12),
      ],
    ),
    Food(
      name: "Hot fudge sundae",
      description:
      "Made with creamy vanilla soft serve and smothered in chocolatey hot fudge topping.",
      imagePath: "lib/images/desserts/hotfudge_dessert.png",
      price: 79,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 10),
        Addon(name: "Chopped Nuts", price: 25),
        Addon(name: "Crushed Strawberries", price: 20),
      ],
    ),
    Food(
      name: "Hot caramel sundaer",
      description:
      "This Caramel Sundae combines creamy vanilla soft serve and warm, buttery caramel topping.",
      imagePath: "lib/images/desserts/hotcaramel_dessert.png",
      price: 79,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Cinnamon Sprinkles", price: 25),
        Addon(name: "Mini Marshmallows", price: 15),
        Addon(name: "Caramel Drizzle", price: 25),
      ],
    ),
    Food(
      name: "Chocolate brownie",
      description:
      "A rich chocolate brownie, with plain chocolate, and with milk chocolate chunks.",
      imagePath: "lib/images/desserts/brownie_dessert.png",
      price: 49,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Crushed Walnuts", price: 35),
        Addon(name: "Vanilla cream", price: 15),
        Addon(name: "Caramel", price: 25),
      ],
    ),
    Food(
      name: "Toffee apple donut",
      description:
      "Ring donut filled with toffee apple compote, topped with crumble pieces and toffee sauce.",
      imagePath: "lib/images/desserts/donut_dessert.png",
      price: 79,
      category: FoodCategory.Desserts,
      availableAddons: [
        Addon(name: "Sliced almonds", price: 35),
        Addon(name: "Coconut Flakes", price: 25),
        Addon(name: "White Chocolate", price: 15),
      ],
    ),

    //drinks
    Food(
      name: "Coke",
      description:
      "Enjoy a cold, refreshing Coca-Cola® soda",
      imagePath: "lib/images/drinks/coke_drinks.png",
      price: 49,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Lemon Slice", price: 25),
        Addon(name: "Ice Cubes", price: 25),
        Addon(name: "Mint Leaves", price: 25),
      ],
    ),
    Food(
      name: "Sprite",
      description:
      "Cool off with the refreshing Sprite®—the classic.",
      imagePath: "lib/images/drinks/sprite_drinks.png",
      price: 49,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Lime Slice", price: 14),
        Addon(name: "Mint Syrup", price: 23),
        Addon(name: "Cucumber Slices", price: 9),
      ],
    ),
    Food(
      name: "Fanta",
      description:
      "Sip on the bubbly, refreshing orange flavor of Fanta®.",
      imagePath: "lib/images/drinks/fanta_drinks.png",
      price: 49,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Orange Slice", price: 15),
        Addon(name: "Pineapple Slice", price: 22),
        Addon(name: "Vanilla Syrup", price: 25),
      ],
    ),
    Food(
      name: "Lemonade",
      description:
          "Made with real lemon juice and real cane sugar.",
      imagePath: "lib/images/drinks/lemonade_drinks.png",
      price: 79,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Mint Leaves", price: 12),
        Addon(name: "Ginger Slice", price: 14),
        Addon(name: "Basil Leaves", price: 9),
      ],
    ),
    Food(
      name: "Sweet tea",
      description:
      "Refreshing blend of orange pekoe and cut black tea.",
      imagePath: "lib/images/drinks/sweettea_drinks.png",
      price: 79,
      category: FoodCategory.Drinks,
      availableAddons: [
        Addon(name: "Honey", price: 25),
        Addon(name: "Cinnamon Stick", price: 12),
        Addon(name: "Peach Syrup", price: 25),
      ],
    ),

  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address (which user can change/ update)
  String _deliveryAddress = "IIT Guwahati";

  /*
  Getters
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //Operations

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
      CartItem? cartItem = _cart.firstWhereOrNull((item) {
        // see if there is a cart item already with the same food and selected addons
        bool isSameFood = item.food == food;

        //check if the list of selected addons are the same
        bool isSameAddons =
            ListEquality().equals(item.selectedAddons, selectedAddons);

        return isSameFood && isSameAddons;
      }
    );

    //if item already exists, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
            food: food,
            selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal*cartItem.quantity;
    }

    return total;
  }

  //get total number of items in cart
  int getTotalItemCount () {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }



  /*
  Helpers
  */

  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
      );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "Rs.${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }

}