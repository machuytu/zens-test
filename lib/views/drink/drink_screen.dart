import 'package:flutter/material.dart';

import 'package:zens_test/view_models/cart_view_model.dart';

import '../../models/drink_model.dart';
import '../../view_models/drink_view_model.dart';
import 'local_widget/widget_filter_drink.dart';
import 'local_widget/widget_header_drink.dart';
import 'local_widget/widget_item_drink.dart';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({super.key});

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  final DrinkViewModel drinkViewModel = DrinkViewModel();
  final CartViewModel cartViewModel = CartViewModel();
  @override
  void initState() {
    /// Loads the drink data from the server.
    drinkViewModel.loadDrink();

    /// Loads the option list for the cart from the server.
    cartViewModel.loadOptionList();

    /// Loads the size list for the cart from the server.
    cartViewModel.loadSizeList();

    /// Loads the topping list for the cart from the server.
    cartViewModel.loadToppingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // Header
          WidgetHeaderDrink(size: size),
          // Body
          Expanded(child: body(size)),
        ],
      ),
    );
  }

  Widget body(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Column(
        children: [
          // Filter
          StreamBuilder<String>(
              stream: drinkViewModel.filterStream,
              initialData: drinkViewModel.filter,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final filterValue = snapshot.data!;
                  return WidgetFilterDrink(
                      size: size,
                      drinkViewModel: drinkViewModel,
                      cartViewModel: cartViewModel,
                      filterValue: filterValue);
                }
                return Container();
              }),

          // List of drinks
          Expanded(
            child: StreamBuilder<List<DrinkModel>>(
              stream: drinkViewModel.drinkStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final drinkItem = snapshot.data![index];
                      return WidgetItemDrink(
                          drinkItem, drinkViewModel, cartViewModel);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
