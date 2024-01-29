import 'package:zens_test/models/drink_model.dart';

/// Represents a cart item in the application.
///
/// The [CartModel] class is used to store information about a cart item, including the drink model, option ID, size ID, and topping ID.
class CartModel {
  DrinkModel? drinkModel;
  int? optionId;
  int? sizeId;
  int? toppingId;

  CartModel({
    this.drinkModel,
    this.optionId,
    this.sizeId,
    this.toppingId,
  });
}
