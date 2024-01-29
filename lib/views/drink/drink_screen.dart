import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zens_test/resources/app_images.dart';
import 'package:zens_test/view_models/cart_view_model.dart';

import '../../models/drink_model.dart';
import '../../view_models/drink_view_model.dart';
import 'widget_header_drink.dart';

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
    drinkViewModel.loadDrink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: body(size),
    );
  }

  Widget body(Size size) {
    return Column(
      children: [
        // Header
        WidgetHeaderDrink(size: size),
        // List of drinks
        StreamBuilder<List<DrinkModel>>(
          stream: drinkViewModel.drinkStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final drinkItem = snapshot.data![index];
                  return ListTile(
                    onTap: () {
                      drinkViewModel.addToCart(
                        cartViewModel,
                        drinkItem,
                      );
                    },
                    title: Text(drinkItem.name ?? ""),
                    subtitle: Text(drinkItem.price.toString()),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
