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
  final List<OptionModel> _optionList = [];
  List<OptionModel> get optionList => _optionList;

  /// Stream of the size list.
  final StreamController<List<SizeModel>> _sizeStreamController =
      StreamController<List<SizeModel>>.broadcast();
  Stream<List<SizeModel>> get sizeStream => _sizeStreamController.stream;
  final List<SizeModel> _sizeList = [];
  List<SizeModel> get sizeList => _sizeList;

  /// Stream of the topping list.
  final StreamController<List<ToppingModel>> _toppingStreamController =
      StreamController<List<ToppingModel>>.broadcast();
  Stream<List<ToppingModel>> get toppingStream =>
      _toppingStreamController.stream;
  final List<ToppingModel> _toppingList = [];
  List<ToppingModel> get toppingList => _toppingList;

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

  /// Loads the list of option assets from 'assets/json/option_json.json'.
  Future<List<OptionModel>> loadOptionList() async {
    String optionJson = await rootBundle.loadString(JsonPath.options);
    List<dynamic> optionData = jsonDecode(optionJson);
    List<OptionModel> optionList =
        optionData.map((data) => OptionModel.fromJson(data)).toList();
    return optionList;
  }

  /// Loads the list of size assets from 'assets/json/size_json.json'.
  Future<List<SizeModel>> loadSizeList() async {
    String sizeJson = await rootBundle.loadString(JsonPath.sizes);
    List<dynamic> sizeData = jsonDecode(sizeJson);
    List<SizeModel> sizeList =
        sizeData.map((data) => SizeModel.fromJson(data)).toList();
    return sizeList;
  }

  /// Loads the list of topping assets from 'assets/json/topping_json.json'.
  Future<List<ToppingModel>> loadToppingList() async {
    String toppingJson = await rootBundle.loadString(JsonPath.topping);
    List<dynamic> toppingData = jsonDecode(toppingJson);
    List<ToppingModel> toppingList =
        toppingData.map((data) => ToppingModel.fromJson(data)).toList();
    return toppingList;
  }

  /// Disposes the stream controller.
  void dispose() {
    _cartStreamController.close();
  }
}
