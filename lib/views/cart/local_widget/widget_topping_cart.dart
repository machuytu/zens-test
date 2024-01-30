import 'package:flutter/material.dart';
import 'package:zens_test/resources/text_data.dart';
import 'package:zens_test/utils/format_text.dart';
import 'package:zens_test/view_models/cart_view_model.dart';

import '../../../models/topping_model.dart';
import '../../../resources/app_text_style.dart';

/// A widget that displays the toppings in the cart.
///
/// This widget is used to show a list of toppings in the cart. It receives a [cartViewModel]
/// and a [toppingId] as parameters. The [cartViewModel] is used to retrieve the list of toppings
/// from the stream and update the selected topping. The [toppingId] represents the currently
/// selected topping.
///

class WidgetToppingCart extends StatelessWidget {
  final int? toppingId;
  final CartViewModel cartViewModel;
  const WidgetToppingCart(this.cartViewModel, this.toppingId, {super.key});

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
                  TextData.toppingText,
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
          StreamBuilder<List<ToppingModel>>(
              stream: cartViewModel.toppingStream,
              initialData: cartViewModel.toppingList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ToppingModel> listToppings = snapshot.data!;
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listToppings.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RadioListTile<int>(
                        onChanged: (int? value) {
                          if (value != null) {
                            cartViewModel
                                .changeTopping(listToppings[index].id!);
                          } else {
                            cartViewModel.changeTopping(null);
                          }
                        },
                        activeColor: const Color(0xFFFE724C),
                        title: Text(listToppings[index].name ?? ""),
                        secondary: Text(
                          "+${FormatText.current(listToppings[index].price ?? 0.0)}",
                        ),
                        groupValue: toppingId,
                        toggleable: true,
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
