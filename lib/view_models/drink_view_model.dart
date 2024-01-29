import 'dart:async';

import 'package:zens_test/models/cart_model.dart';
import 'package:zens_test/models/drink_model.dart';
import 'package:zens_test/resources/json_path.dart';
import 'package:zens_test/utils/load_json.dart';

import 'cart_view_model.dart';

/// A view model class for managing the drink functionality.
/// It provides methods to add drinks to the drink and dispose of the stream controller.
class DrinkViewModel {
  final StreamController<List<DrinkModel>> _drinkStreamController =
      StreamController<List<DrinkModel>>.broadcast();
  List<DrinkModel> _drinkList = [];

  /// Stream of the drink list.
  Stream<List<DrinkModel>> get drinkStream => _drinkStreamController.stream;

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

  /// Disposes the stream controller.
  void dispose() {
    _drinkStreamController.close();
  }
}
