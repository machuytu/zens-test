import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zens_test/resources/app_images.dart';
import 'package:zens_test/resources/app_text_style.dart';
import 'package:zens_test/resources/text_data.dart';
import 'package:zens_test/view_models/drink_view_model.dart';

import '../../../view_models/cart_view_model.dart';
import '../../../widgets/widget_cart_button.dart';

/// A widget that displays a filter for drinks.
///
/// This widget allows the user to select a filter value from a dropdown menu.
/// The selected filter value is used to filter the drinks displayed in the UI.
///
/// The [size] parameter specifies the size of the widget.
/// The [drinkViewModel] parameter is the view model for drinks.
/// The [cartViewModel] parameter is the view model for the cart.
/// The [filterValue] parameter is the initial value for the filter dropdown.
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
              TextData.findWith,
              textAlign: TextAlign.center,
              style: AppTextStyle.dropDownTitleTextStyle,
            ),
            const SizedBox(width: 16),
            DropdownMenu<String>(
              controller: TextEditingController(text: filterValue),
              onSelected: (String? value) {
                if (value != null) {
                  drinkViewModel.filterDrink(value);
                }
              },
              textStyle: AppTextStyle.dropDownTextStyle,
              selectedTrailingIcon: SvgPicture.asset(AppImages.downIcon),
              trailingIcon: SvgPicture.asset(AppImages.downIcon),
              inputDecorationTheme: const InputDecorationTheme(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                constraints: BoxConstraints(maxHeight: 40, maxWidth: 135),
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
        WidgetCartButton(cartViewModel, drinkViewModel: drinkViewModel),
      ],
    );
  }
}
