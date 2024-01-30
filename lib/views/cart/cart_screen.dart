import 'package:flutter/material.dart';

import 'package:zens_test/view_models/cart_view_model.dart';
import 'package:zens_test/views/cart/local_widget/widget_note_cart.dart';
import 'package:zens_test/views/cart/local_widget/widget_topping_cart.dart';
import 'package:zens_test/views/cart/local_widget/widget_header_cart.dart';

import '../../models/cart_model.dart';
import 'local_widget/widget_bottom_cart.dart';
import 'local_widget/widget_image_cart_item.dart';
import 'local_widget/widget_option_cart.dart';
import 'local_widget/widget_size_cart.dart';

class CartScreen extends StatefulWidget {
  final CartViewModel cartViewModel;
  const CartScreen({super.key, required this.cartViewModel});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  /// Focus node for the note text field.
  FocusNode noteFocusNode = FocusNode();

  /// Note controller for the note text field.
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    /// Loads the size, topping, option list for the cart from the server.
    widget.cartViewModel.loadInit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: StreamBuilder<List<CartModel>>(
              stream: widget.cartViewModel.cartStream,
              initialData: widget.cartViewModel.cartList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final cartItem = snapshot.data!.last;
                  return body(cartItem, size);
                }
                return const SizedBox();
              }),
        ),
      ),
    );
  }

  /// Body for the cart screen.
  Widget body(CartModel cartItem, Size size) {
    final drink = cartItem.drinkModel;
    return Stack(
      children: [
        // Image on top of the screen
        WidgetImageCartItem(
          cartItem: cartItem,
          cartViewModel: widget.cartViewModel,
          size: size,
        ),
        Positioned(
          top: 270,
          child: Container(
            width: size.width,
            height: size.height - 270,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header cart
                  WidgetHeaderCart(drink: drink),

                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        // Choice size cart (have to)
                        WidgetSizeCart(widget.cartViewModel, cartItem.sizeId!),

                        // Choice topping cart (not have to)
                        WidgetToppingCart(
                            widget.cartViewModel, cartItem.toppingId),

                        // Choice option cart (not have to)
                        WidgetOptionCart(
                            widget.cartViewModel, cartItem.optionId),

                        // Add note to the cart item
                        WidgetNoteCart(
                            widget.cartViewModel, noteFocusNode, noteController)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Bottom of the screen
        WidgetBottomCart(
          size: size,
          cartViewModel: widget.cartViewModel,
          total: cartItem.total,
          payment: cartItem.payment,
        ),
      ],
    );
  }
}
