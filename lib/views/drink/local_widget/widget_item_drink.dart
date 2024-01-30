import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zens_test/models/drink_model.dart';
import 'package:zens_test/resources/app_images.dart';
import 'package:zens_test/resources/app_text_style.dart';
import 'package:zens_test/view_models/drink_view_model.dart';

import '../../../view_models/cart_view_model.dart';
import 'widget_add_drink.dart';
import 'widget_image_drink.dart';

/// A widget that represents an item of a drink in a list.
///
/// This widget displays the name, description, rating, and favorite count of a drink.
/// It also provides an option to add the drink to the cart.
class WidgetItemDrink extends StatelessWidget {
  final DrinkModel drinkItem;
  final DrinkViewModel drinkViewModel;
  final CartViewModel cartViewModel;
  const WidgetItemDrink(this.drinkItem, this.drinkViewModel, this.cartViewModel,
      {super.key});

  @override
  Widget build(BuildContext context) {
    var formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 1,
      locale: 'en_US',
      symbol: '',
    ).format(drinkItem.favorite);
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        decoration: shadowItemDrink(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetImageDrink(
                drinkItem: drinkItem, drinkViewModel: drinkViewModel),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drinkItem.name ?? "",
                        style: AppTextStyle.listDrinkNameTextStyle,
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          drinkItem.description ?? "",
                          style: AppTextStyle.drinkDescriptionTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.starIcon),
                              const SizedBox(width: 4),
                              Text(
                                "${drinkItem.rating}",
                                style: AppTextStyle.drinkDetailTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(width: 32),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.heartRating),
                              const SizedBox(width: 8),
                              Text(
                                formattedNumber,
                                style: AppTextStyle.drinkDetailTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      AddDrinkIcon(
                          onTap: () => drinkViewModel.addToCart(
                              cartViewModel, drinkItem)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ShapeDecoration shadowItemDrink() {
    return ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3FD3D1D8),
          blurRadius: 36.43,
          offset: Offset(18.21, 18.21),
          spreadRadius: 0,
        )
      ],
    );
  }
}
