import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zens_test/resources/app_images.dart';
import 'package:zens_test/view_models/drink_view_model.dart';

import '../../../view_models/cart_view_model.dart';
import 'widget_cart_button.dart';

class WidgetFilterDrink extends StatelessWidget {
  final DrinkViewModel drinkViewModel;
  final CartViewModel cartViewModel;
  final Size size;
  final String filterValue;

  const WidgetFilterDrink({
    super.key,
    required this.size,
    required this.drinkViewModel,
    required this.cartViewModel,
    required this.filterValue,
  });

  @override
  Widget build(BuildContext context) {
    List<String> filterList = ['Phổ biến', 'Mua Nhiều', 'Giá rẻ'];
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Tìm kiếm theo:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF111719),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(width: 16),
            DropdownMenu<String>(
              controller: TextEditingController(text: filterValue),
              onSelected: (String? value) {
                if (value != null) {
                  drinkViewModel.filterDrink(value);
                }
              },
              textStyle: const TextStyle(
                color: Color(0xFFFE724C),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              selectedTrailingIcon: SvgPicture.asset(AppImages.downIcon),
              trailingIcon: SvgPicture.asset(AppImages.downIcon),
              inputDecorationTheme: const InputDecorationTheme(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                constraints: BoxConstraints(maxHeight: 40, maxWidth: 140),
              ),
              dropdownMenuEntries: filterList
                  .map<DropdownMenuEntry<String>>((String filterValue) {
                return DropdownMenuEntry<String>(
                  value: filterValue,
                  label: filterValue,
                );
              }).toList(),
            )
          ],
        ),
        WidgetCartButton(cartViewModel, drinkViewModel),
      ],
    );
  }
}
