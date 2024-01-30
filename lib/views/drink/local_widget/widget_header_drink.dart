import 'package:flutter/material.dart';

import '../../../resources/app_images.dart';

class WidgetHeaderDrink extends StatelessWidget {
  final Size size;
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
                        text: 'Trà\n',
                        style: TextStyle(
                          color: Color(0xFF272D2F),
                          fontSize: 44,
                        ),
                      ),
                      TextSpan(
                        text: 'Mix\n',
                        style: TextStyle(
                          color: Color(0xFFFE724C),
                          fontSize: 68,
                          fontFamily: 'Righteous',
                        ),
                      ),
                      TextSpan(
                        text: '40 sự lựa chọn cho bạn',
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
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
