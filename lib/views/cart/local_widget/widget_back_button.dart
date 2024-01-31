import 'package:flutter/material.dart';
import 'package:zens_test/resources/app_box_shadow.dart';

/// Back button widget
class WidgetBackButton extends StatelessWidget {
  const WidgetBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: 36,
        height: 40,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: AppBoxShadow.button,
        ),
        child: const Center(
            child: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        )),
      ),
    );
  }
}
