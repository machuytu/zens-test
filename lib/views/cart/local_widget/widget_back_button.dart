import 'package:flutter/material.dart';

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
          shadows: const [
            BoxShadow(
              color: Color(0x4CD3D1D8),
              blurRadius: 20,
              offset: Offset(5, 10),
              spreadRadius: 0,
            )
          ],
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
