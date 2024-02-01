import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zens_test/models/drink_model.dart';
import 'package:zens_test/resources/json_path.dart';
import 'package:zens_test/utils/load_json.dart';

import '../views/cart/cart_screen.dart';
import 'cart_view_model.dart';

/// A view model class for managing the drink functionality.
/// It provides methods to add drinks to the drink and dispose of the stream controller.
class DrinkViewModel {
  /// Stream of the filter.
  final StreamController<String> _filterStreamController =
      StreamController<String>.broadcast();
  String _filter = "Phổ biến";
  String get filter => _filter;
  Stream<String> get filterStream => _filterStreamController.stream;

  /// Stream of the drink list.
  final StreamController<List<DrinkModel>> _drinkStreamController =
      StreamController<List<DrinkModel>>.broadcast();
  List<DrinkModel> _drinkList = [];
  Stream<List<DrinkModel>> get drinkStream => _drinkStreamController.stream;

  /// Choose the filter.
  chooseFilter(String filter) {
    _filter = filter;
    _filterStreamController.add(_filter);
  }

  /// Init filter.
  loadFilter() {
    _filterStreamController.add(_filter);
  }

  /// Filter the drink list.
  filterDrink(String filter) {
    if (filter == "Phổ biến") {
      _drinkList.sort((a, b) => b.favorite!.compareTo(a.favorite!));
    } else if (filter == "Mua Nhiều") {
      _drinkList.sort((a, b) => b.rating!.compareTo(a.rating!));
    } else if (filter == "Giá rẻ") {
      _drinkList.sort((a, b) => a.salePrice!.compareTo(b.salePrice!));
    }
    _drinkStreamController.add(_drinkList);
  }

  /// Click the favorite button.
  void clickFavorite(DrinkModel drinkItem) {
    _drinkList.where((element) => element.id == drinkItem.id).first.choose =
        drinkItem.choose;
    _drinkStreamController.add(_drinkList);
  }

  /// Init the drink list.
  Future<void> loadDrink() async {
    // Get the list of drinks from the JSON file.
    LoadJson loadJson = LoadJson();
    final res = await loadJson(JsonPath.drinks);

    List<DrinkModel> listDrink = [];
    for (var item in res) {
      listDrink.add(DrinkModel.fromJson(item));
    }
    _drinkList = listDrink;
    _drinkStreamController.add(_drinkList);
  }

  /// Add a new drink to the list
  addToCart(
    CartViewModel cartViewModel,
    DrinkModel drink,
  ) async {
    cartViewModel.addDrink(drink);
  }

  openCartScreen(BuildContext context, CartViewModel cartViewModel) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CartScreen(cartViewModel: cartViewModel);
    }));
  }

  /// Disposes the stream controller.
  void dispose() {
    _drinkStreamController.close();
    _filterStreamController.close();
  }
}
