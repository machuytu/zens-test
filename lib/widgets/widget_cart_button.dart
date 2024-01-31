import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zens_test/resources/app_colors.dart';
import 'package:zens_test/resources/app_text_style.dart';
import 'package:zens_test/view_models/cart_view_model.dart';
import 'package:zens_test/view_models/drink_view_model.dart';

import '../models/cart_model.dart';
import '../resources/app_box_shadow.dart';
import '../resources/app_images.dart';

/// A widget that represents a cart button.
///
/// This widget displays a cart button with a badge indicating the number of items in the cart.
/// It takes a [cartViewModel] as a required parameter and an optional [drinkViewModel].
/// The [cartViewModel] is used to listen to changes in the cart and update the badge count.
/// The [drinkViewModel] is used to open the cart screen when the button is tapped.
class WidgetCartButton extends StatelessWidget {
  final CartViewModel cartViewModel;
  final DrinkViewModel? drinkViewModel;
  const WidgetCartButton(
    this.cartViewModel, {
    this.drinkViewModel,
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
            return body(cartList, context);
          }
          return const SizedBox();
        });
  }

  GestureDetector body(List<CartModel> cartList, BuildContext context) {
    return GestureDetector(
      onTap: () => cartList.isNotEmpty
          ? drinkViewModel?.openCartScreen(context, cartViewModel)
          : null,
      child: Container(
        width: 36,
        height: 40,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: AppBoxShadow.button,
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
                    color: AppColors.red,
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
                        style: AppTextStyle.totalCartTextStyle,
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
}
