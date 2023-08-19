import 'package:flutter/cupertino.dart';

import 'models.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foods = [
    Food(
        name: "Sushi plat 1 ",
        price: "22.00£",
        imagepath: "images/sushi_picture1.png",
        rating: "7.0"),
    Food(
        name: "Sushi plat 2",
        price: "12.00£",
        imagepath: "images/sushi_picture2.png",
        rating: "9.0")
  ];

  List<Food> _cart = [];

  List<Food> get foodmenu => _foods;

  List<Food> get cart => _cart;

  void addToCart(Food food, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(food);
    }
    notifyListeners();
  }

  void removefromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
