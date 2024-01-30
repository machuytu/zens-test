import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetChangeTotalButton extends StatelessWidget {
  final String assetName;
  final void Function()? onTap;
  const WidgetChangeTotalButton({
    super.key,
    required this.assetName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Color(0xFFFE724C),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          assetName,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
