import 'package:flutter/material.dart';
import 'package:zens_test/resources/text_data.dart';
import 'package:zens_test/utils/format_text.dart';
import 'package:zens_test/view_models/cart_view_model.dart';

import '../../../models/size_model.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_text_style.dart';

/// A widget that displays a list of sizes for a cart item.
///
/// This widget is used to show a list of available sizes for a cart item.
/// It receives a [sizeId] and a [cartViewModel] as parameters.
/// The [sizeId] represents the currently selected size.
/// The [cartViewModel] is used to retrieve the list of available sizes.
///
class WidgetSizeCart extends StatelessWidget {
  final int sizeId;
  final CartViewModel cartViewModel;
  const WidgetSizeCart(this.cartViewModel, this.sizeId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 28,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  TextData.sizeText,
                  style: AppTextStyle.cartOptionTextStyle,
                ),
                SizedBox(width: 4),
                Text(
                  TextData.haveTo,
                  style: AppTextStyle.drinkDescriptionTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          StreamBuilder<List<SizeModel>>(
              stream: cartViewModel.sizeStream,
              initialData: cartViewModel.sizeList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<SizeModel> listSizes = snapshot.data!;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listSizes.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RadioListTile<int>(
                        onChanged: (int? value) {
                          cartViewModel.changeSize(listSizes[index].id!);
                        },
                        activeColor: AppColors.primary,
                        title: Text(listSizes[index].name ?? ""),
                        secondary: Text(
                          "+${FormatText.current(listSizes[index].price ?? 0.0)}",
                        ),
                        groupValue: sizeId,
                        value: index + 1,
                      );
                    },
                  );
                }
                return const SizedBox();
              })
        ],
      ),
    );
  }
}
