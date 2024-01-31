import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zens_test/resources/app_box_shadow.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_images.dart';

/// A widget that displays an icon for adding a drink.
///
/// This widget is typically used as a button to trigger an action when tapped.
/// It displays a circular container with a plus icon inside.
/// The color of the container can be customized using the [color] property.
/// The [onTap] callback is called when the icon is tapped.
class AddDrinkIcon extends StatelessWidget {
  final void Function()? onTap;
  const AddDrinkIcon({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        padding: const EdgeInsets.all(5.33),
        decoration: const ShapeDecoration(
          color: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          shadows: AppBoxShadow.addDrink,
        ),
        child: SizedBox(
          width: 21.33,
          height: 21.33,
          child: SvgPicture.asset(AppImages.plusIcon),
        ),
      ),
    );
  }
}
