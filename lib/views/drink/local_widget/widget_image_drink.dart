import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../models/drink_model.dart';
import '../../../resources/app_images.dart';
import '../../../view_models/drink_view_model.dart';

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
    final NumberFormat currency = NumberFormat('#,##0', 'vi_VN');
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
                "${currency.format(drinkItem.salePrice)}đ",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF040303),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.10,
                  letterSpacing: 0.14,
                ),
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
