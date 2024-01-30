import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zens_test/view_models/cart_view_model.dart';
import 'package:zens_test/view_models/drink_view_model.dart';

import '../../../models/cart_model.dart';
import '../../../resources/app_images.dart';

class WidgetCartButton extends StatelessWidget {
  final CartViewModel cartViewModel;
  final DrinkViewModel drinkViewModel;
  const WidgetCartButton(
    this.cartViewModel,
    this.drinkViewModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CartModel>>(
        stream: cartViewModel.cartStream,
        initialData: cartViewModel.cartList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cartList = snapshot.data!;
            return GestureDetector(
              onTap: () => cartList.isNotEmpty
                  ? drinkViewModel.openCartScreen(context, cartViewModel)
                  : null,
              child: Container(
                width: 36,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x4CD3D1D8),
                      blurRadius: 20,
                      offset: Offset(5, 10),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Center(child: SvgPicture.asset(AppImages.cartIcon)),
                    Positioned(
                      right: 0,
                      bottom: 22,
                      child: SizedBox(
                        width: 18,
                        height: 18,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF11616),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: SizedBox(
                            width: 10,
                            height: 10,
                            child: Center(
                              child: Text(
                                cartList.length.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        });
  }
}
