import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zens_test/resources/app_box_shadow.dart';
import 'package:zens_test/resources/app_images.dart';
import 'package:zens_test/resources/app_text_style.dart';
import 'package:zens_test/resources/text_data.dart';
import 'package:zens_test/utils/format_text.dart';
import 'package:zens_test/view_models/cart_view_model.dart';

import '../../../resources/app_colors.dart';
import 'widget_change_total_button.dart';

/// This widget represents the bottom section of the cart view.
/// It displays the total amount and provides buttons to increase or decrease the total quantity.
/// It also includes a payment button to add the order.
class WidgetBottomCart extends StatelessWidget {
  final CartViewModel cartViewModel;
  final Size size;
  final int? total;
  final double? payment;
  final TextEditingController noteController;
  const WidgetBottomCart({
    super.key,
    required this.size,
    required this.cartViewModel,
    required this.total,
    required this.payment,
    required this.noteController,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          width: size.width,
          height: 124,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: AppBoxShadow.totalItem,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Decrease total and increase total item on the order
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WidgetChangeTotalButton(
                    assetName: AppImages.minusIcon,
                    onTap: () => cartViewModel.decreaseTotal(),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    total!.toString().padLeft(2, '0'),
                    style: AppTextStyle.totalTextStyle,
                  ),
                  const SizedBox(width: 20),
                  WidgetChangeTotalButton(
                    assetName: AppImages.plusIcon,
                    onTap: () => cartViewModel.increaseTotal(),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Payment button
              GestureDetector(
                onTap: () => cartViewModel.addOrder(noteController.text),
                child: SizedBox(
                  height: 52,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      shadows: AppBoxShadow.paymentButton,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: SvgPicture.asset(
                            AppImages.paymentIcon,
                            fit: BoxFit.none,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          TextData.addOrder(
                              "${FormatText.current(payment ?? 0.0)}"),
                          textAlign: TextAlign.center,
                          style: AppTextStyle.paymentTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
