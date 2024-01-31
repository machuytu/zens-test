import 'package:flutter/material.dart';
import 'package:zens_test/resources/app_text_style.dart';
import 'package:zens_test/resources/text_data.dart';

import '../../../resources/app_images.dart';

/// A widget that displays the header of a drink.
///
/// This widget is used to show the header of a drink in a specific layout.
/// It includes an image background, a header image, and text describing the drink.
class WidgetHeaderDrink extends StatelessWidget {
  final Size size;

  /// Constructs a [WidgetHeaderDrink] with the given [size].
  const WidgetHeaderDrink({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 315.52,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: 315.52,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.bgHeader), fit: BoxFit.fill),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 315.52,
              width: 211,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.headerImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: SafeArea(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: TextData.banner1,
                        style: AppTextStyle.bannerTextStyle,
                      ),
                      TextSpan(
                        text: TextData.banner2,
                        style: AppTextStyle.bannerPriorityTextStyle,
                      ),
                      TextSpan(
                        text: TextData.banner3,
                        style: AppTextStyle.bannerDescriptionTextStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
