import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/cart_model.dart';
import '../../models/drink_model.dart';
import '../../resources/app_images.dart';

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
          style: const TextStyle(
            color: Color(0xFF040202),
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 364,
          child: Text(
            drink!.description ?? "",
            style: const TextStyle(
              color: Color(0xFF616161),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          width: 364,
          height: 28,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        style: const TextStyle(
                          color: Color(0xFF040202),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '59.000đ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Color(0xFF616161),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    '45.000đ',
                    style: TextStyle(
                      color: Color(0xFFFE724C),
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
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
