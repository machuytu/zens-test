import 'dart:async';

import 'package:zens_test/models/cart_model.dart';

import '../models/drink_model.dart';

/// A view model class for managing the cart functionality.
/// It provides methods to add drinks to the cart and dispose of the stream controller.
class CartViewModel {
  final StreamController<List<CartModel>> _cartStreamController =
      StreamController<List<CartModel>>.broadcast();
  List<CartModel> _cartList = [];

  /// Stream of the cart list.
  Stream<List<CartModel>> get cartStream => _cartStreamController.stream;

  /// Adds a drink to the cart.
  void addDrink(DrinkModel drink,
      {int sizeId = 0, int? optionId, int? toppingId}) {
    CartModel cartModel = CartModel(
      drinkModel: drink,
      optionId: optionId, // optional
      sizeId: sizeId, // Default size is 0 (S)
      toppingId: toppingId, // optional
    );
    _cartList = [..._cartList, cartModel];
    _cartStreamController.add(_cartList);
  }

  /// Disposes the stream controller.
  void dispose() {
    _cartStreamController.close();
  }
}
