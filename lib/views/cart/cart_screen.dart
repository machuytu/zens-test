import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:zens_test/models/drink_model.dart';
import 'package:zens_test/resources/app_images.dart';
import 'package:zens_test/view_models/cart_view_model.dart';
import 'package:zens_test/views/cart/widget_header_cart.dart';

import '../../models/cart_model.dart';

class CartScreen extends StatefulWidget {
  final CartViewModel cartViewModel;
  const CartScreen({super.key, required this.cartViewModel});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
    );
  }

  Widget body(CartModel cartItem, Size size) {
    final drink = cartItem.drinkModel;
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
                    WidgetHeaderCart(drink: drink),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
