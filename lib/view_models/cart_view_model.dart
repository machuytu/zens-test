import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zens_test/models/cart_model.dart';
import 'package:zens_test/models/option_model.dart';
import 'package:zens_test/models/size_model.dart';
import 'package:zens_test/models/topping_model.dart';
import 'package:zens_test/resources/json_path.dart';

import '../models/drink_model.dart';

/// A view model class for managing the cart functionality.
/// It provides methods to add drinks to the cart and dispose of the stream controller.
class CartViewModel {
  /// Stream of the cart list.
  final StreamController<List<CartModel>> _cartStreamController =
      StreamController<List<CartModel>>.broadcast();
  Stream<List<CartModel>> get cartStream => _cartStreamController.stream;
  List<CartModel> _cartList = [];
  List<CartModel> get cartList => _cartList;

  /// Stream of the option list.
  final StreamController<List<OptionModel>> _optionStreamController =
      StreamController<List<OptionModel>>.broadcast();
  Stream<List<OptionModel>> get optionStream => _optionStreamController.stream;
  List<OptionModel> _optionList = [];
  List<OptionModel> get optionList => _optionList;

  /// Stream of the size list.
  final StreamController<List<SizeModel>> _sizeStreamController =
      StreamController<List<SizeModel>>.broadcast();
  Stream<List<SizeModel>> get sizeStream => _sizeStreamController.stream;
  List<SizeModel> _sizeList = [];
  List<SizeModel> get sizeList => _sizeList;

  /// Stream of the topping list.
  final StreamController<List<ToppingModel>> _toppingStreamController =
      StreamController<List<ToppingModel>>.broadcast();
  Stream<List<ToppingModel>> get toppingStream =>
      _toppingStreamController.stream;
  List<ToppingModel> _toppingList = [];
  List<ToppingModel> get toppingList => _toppingList;

  /// Adds a drink to the cart.
  void addDrink(DrinkModel drink,
      {int sizeId = 1, int? optionId, int? toppingId}) {
    // Payment init drink
    final payment = paymentCart(drink, 1);
    CartModel cartModel = CartModel(
      drinkModel: drink,
      optionId: optionId, // optional
      sizeId: sizeId, // Default size is 1 (S)
      toppingId: toppingId, // optional
      total: 1,
      payment: payment,
    );
    _cartList = [..._cartList, cartModel];
    _cartStreamController.add(_cartList);
  }

  /// Calculates the payment for a drink in the cart.
  ///
  /// The payment is calculated based on the sale price of the drink and any additional costs such as the selected size, topping, and option.
  /// The [drink] parameter represents the drink model for which the payment is being calculated.
  /// The [total] parameter represents the total quantity of the drink in the cart.
  /// The optional parameters [sizeId], [optionId], and [toppingId] represent the selected size, option, and topping IDs respectively.
  /// Returns the calculated payment as a double value.
  double paymentCart(DrinkModel drink, total,
      {int? sizeId, int? optionId, int? toppingId}) {
    // Calculate the payment based on the sale price of the drink and any additional costs
    double payment = drink.salePrice!;

    // Add the price of the selected size, if any
    if (sizeId != null) {
      payment +=
          _sizeList.where((element) => element.id == sizeId).first.price ?? 0.0;
    }

    // Add the price of the selected topping, if any
    if (toppingId != null) {
      payment += _toppingList
              .where((element) => element.id == toppingId)
              .first
              .price ??
          0.0;
    }

    // Add the price of the selected option, if any
    if (optionId != null) {
      payment +=
          _optionList.where((element) => element.id == optionId).first.price ??
              0.0;
    }
    payment *= total;
    return payment;
  }

  /// Loads a new payment for the last item in the cart list.
  /// The payment is calculated based on the drink model, total price, and selected options.
  void loadNewPayment() {
    _cartList.last.payment = paymentCart(
      _cartList.last.drinkModel!,
      _cartList.last.total,
      optionId: _cartList.last.optionId,
      toppingId: _cartList.last.toppingId,
      sizeId: _cartList.last.sizeId,
    );
  }

  /// Loads the initial data for the cart view model.
  /// This includes loading the option list, size list, and topping list.
  void loadInit() {
    loadOptionList();
    loadSizeList();
    loadToppingList();
  }

  /// Loads the list of option assets from 'assets/json/option_json.json'.
  Future<void> loadOptionList() async {
    String optionJson = await rootBundle.loadString(JsonPath.options);
    List<dynamic> optionData = jsonDecode(optionJson);
    List<OptionModel> optionList =
        optionData.map((data) => OptionModel.fromJson(data)).toList();
    _optionList = optionList;
    _optionStreamController.add(_optionList);
  }

  /// Loads the list of size assets from 'assets/json/size_json.json'.
  Future<void> loadSizeList() async {
    String sizeJson = await rootBundle.loadString(JsonPath.sizes);
    List<dynamic> sizeData = jsonDecode(sizeJson);
    List<SizeModel> sizeList =
        sizeData.map((data) => SizeModel.fromJson(data)).toList();
    _sizeList = sizeList;
    _sizeStreamController.add(_sizeList);
  }

  /// Loads the list of topping assets from 'assets/json/topping_json.json'.
  Future<void> loadToppingList() async {
    String toppingJson = await rootBundle.loadString(JsonPath.topping);
    List<dynamic> toppingData = jsonDecode(toppingJson);
    List<ToppingModel> toppingList =
        toppingData.map((data) => ToppingModel.fromJson(data)).toList();
    _toppingList = toppingList;
    _toppingStreamController.add(_toppingList);
  }

  /// Change size cart item
  void changeSize(int optionId) {
    _cartList.last.sizeId = optionId;
    loadNewPayment();
    _cartStreamController.add(_cartList);
  }

  /// Change topping cart item
  void changeTopping(int? optionId) {
    _cartList.last.toppingId = optionId;
    loadNewPayment();
    _cartStreamController.add(_cartList);
  }

  /// Change option cart item
  void changeOption(int? optionId) {
    _cartList.last.optionId = optionId;
    loadNewPayment();
    _cartStreamController.add(_cartList);
  }

  /// Increase total of cart items
  increaseTotal() {
    _cartList.last.total = _cartList.last.total! + 1;
    loadNewPayment();
    _cartStreamController.add(_cartList);
  }

  /// Decrease total of cart items
  decreaseTotal() {
    if (_cartList.last.total! > 1) {
      _cartList.last.total = _cartList.last.total! - 1;
      loadNewPayment();
      _cartStreamController.add(_cartList);
    }
  }

  addOrder(String note) {
    _cartList.last.note = note;
    _cartStreamController.add(_cartList);
  }

  /// Disposes the stream controller.
  void dispose() {
    _cartStreamController.close();
  }
}
