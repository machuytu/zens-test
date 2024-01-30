import 'package:flutter/material.dart';

import '../../../models/cart_model.dart';
import '../../../view_models/cart_view_model.dart';
import '../../../widgets/widget_cart_button.dart';
import 'widget_back_button.dart';

/// A widget that displays the image of a cart item.
///
/// This widget is used to show the image of a cart item in the cart view.
/// It takes a [cartItem] and [cartViewModel] as required parameters.
/// The [cartItem] represents the cart item model, and the [cartViewModel]
/// represents the view model for the cart.
class WidgetImageCartItem extends StatelessWidget {
  final Size size;
  final CartModel cartItem;
  final CartViewModel cartViewModel;
  const WidgetImageCartItem({
    super.key,
    required this.cartItem,
    required this.cartViewModel,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 315.52,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(cartItem.drinkModel!.img!),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 12,
          left: 24,
          right: 24,
          child: SizedBox(
            width: size.width,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WidgetBackButton(),
                  WidgetCartButton(cartViewModel),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
