import 'package:flutter/material.dart';
import 'package:zens_test/resources/text_data.dart';
import 'package:zens_test/utils/format_text.dart';
import 'package:zens_test/view_models/cart_view_model.dart';

import '../../../models/option_model.dart';
import '../../../resources/app_text_style.dart';

/// A widget that displays a list of options for a cart item.
///
/// This widget is used to show a list of options for a specific cart item.
/// It receives a [cartViewModel] and an [optionId] as parameters.
/// The [cartViewModel] is used to retrieve the list of options from a stream.
/// The [optionId] represents the currently selected option.
///
class WidgetOptionCart extends StatelessWidget {
  final int? optionId;
  final CartViewModel cartViewModel;
  const WidgetOptionCart(this.cartViewModel, this.optionId, {super.key});

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
                  TextData.optionText,
                  style: AppTextStyle.cartOptionTextStyle,
                ),
                SizedBox(width: 4),
                Text(
                  TextData.notHaveTo,
                  style: AppTextStyle.drinkDescriptionTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          StreamBuilder<List<OptionModel>>(
              stream: cartViewModel.optionStream,
              initialData: cartViewModel.optionList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<OptionModel> listOptions = snapshot.data!;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listOptions.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RadioListTile<int?>(
                        onChanged: (int? value) {
                          if (value != null) {
                            cartViewModel.changeOption(listOptions[index].id!);
                          } else {
                            cartViewModel.changeOption(null);
                          }
                        },
                        activeColor: const Color(0xFFFE724C),
                        title: Text(listOptions[index].name ?? ""),
                        secondary: Text(
                          "+${FormatText.current(listOptions[index].price ?? 0.0)}",
                        ),
                        groupValue: optionId,
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
