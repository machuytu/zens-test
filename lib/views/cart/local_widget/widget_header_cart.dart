import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zens_test/resources/app_text_style.dart';
import 'package:zens_test/utils/format_text.dart';

import '../../../models/drink_model.dart';
import '../../../resources/app_images.dart';

/// A widget that displays the header of a cart item.
///
/// This widget is used to show the name, description, rating, and price of a drink in the cart.
/// It takes a [DrinkModel] as input and displays the relevant information.
class WidgetHeaderCart extends StatelessWidget {
  const WidgetHeaderCart({
    super.key,
    required this.drink,
  });

  final DrinkModel? drink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          drink!.name ?? "",
          style: AppTextStyle.drinkNameTextStyle,
        ),
        SizedBox(
          width: 364,
          child: Text(
            drink!.description ?? "",
            style: AppTextStyle.drinkDescriptionTextStyle,
          ),
        ),
        SizedBox(
          width: 364,
          height: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.starIcon),
                      const SizedBox(width: 8),
                      Text(
                        "${drink!.rating}",
                        style: AppTextStyle.ratingTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${FormatText.current(drink!.price ?? 0.0)}",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.priceLineThroughTextStyle,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${FormatText.current(drink!.salePrice ?? 0.0)}",
                    style: AppTextStyle.priceTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
