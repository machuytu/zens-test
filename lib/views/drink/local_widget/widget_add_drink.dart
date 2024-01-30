import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/app_images.dart';

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
          color: Color(0xFFFE724C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x66FE724C),
              blurRadius: 18.21,
              offset: Offset(0, 8.50),
              spreadRadius: 0,
            )
          ],
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