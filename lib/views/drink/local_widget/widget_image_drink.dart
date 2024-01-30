import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zens_test/resources/app_text_style.dart';

import '../../../models/drink_model.dart';
import '../../../resources/app_images.dart';
import '../../../utils/format_text.dart';
import '../../../view_models/drink_view_model.dart';

/// A widget that displays an image of a drink with additional UI elements such as price and favorite button.
///
/// This widget takes a [drinkItem] of type [DrinkModel] and a [drinkViewModel] of type [DrinkViewModel] as required parameters.
/// The [drinkItem] represents the drink item to be displayed, while the [drinkViewModel] is used to handle the favorite button click event.
///
/// The widget renders a stack of UI elements including an image container, a price label, and a favorite button.
/// The image container displays the image of the drink item with a circular border.
/// The price label shows the sale price of the drink item in a centered position.
/// The favorite button allows the user to toggle the favorite status of the drink item.
class WidgetImageDrink extends StatelessWidget {
  const WidgetImageDrink({
    super.key,
    required this.drinkItem,
    required this.drinkViewModel,
  });

  final DrinkModel drinkItem;

  final DrinkViewModel drinkViewModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(drinkItem.img!),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Positioned(
          left: 12,
          top: 12,
          child: Container(
            width: 84,
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Center(
              child: Text(
                FormatText.current(drinkItem.salePrice ?? 0.0),
                textAlign: TextAlign.center,
                style: AppTextStyle.drinkSalePriceTextStyle,
              ),
            ),
          ),
        ),
        Positioned(
            right: 12,
            top: 12,
            child: GestureDetector(
              onTap: () {
                drinkItem.choose = !drinkItem.choose!;
                drinkViewModel.clickFavorite(drinkItem);
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    drinkItem.choose! ? AppImages.heartOn : AppImages.heartOff,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
