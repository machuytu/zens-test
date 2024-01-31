import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  static const TextStyle bannerTextStyle = TextStyle(
    color: AppColors.banner,
    fontSize: 44,
  );
  static const TextStyle bannerPriorityTextStyle = TextStyle(
    color: AppColors.primary,
    fontSize: 68,
    fontFamily: 'Righteous',
  );
  static const TextStyle bannerDescriptionTextStyle = TextStyle(
    color: AppColors.detail,
    fontSize: 16,
    fontFamily: 'Poppins',
  );
  static const TextStyle priceTextStyle = TextStyle(
    color: AppColors.primary,
    fontSize: 24,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle priceLineThroughTextStyle = TextStyle(
    decoration: TextDecoration.lineThrough,
    color: AppColors.detail,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle listDrinkNameTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18.21,
    fontFamily: 'Poppins',
  );
  static const TextStyle drinkNameTextStyle = TextStyle(
    color: AppColors.title,
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle drinkDescriptionTextStyle = TextStyle(
    color: AppColors.detail,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );
  static const TextStyle noteDescriptionTextStyle = TextStyle(
    color: AppColors.detail,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle drinkDetailTextStyle = TextStyle(
    color: AppColors.detail,
    fontSize: 12,
    fontFamily: 'Poppins',
  );
  static const TextStyle drinkSalePriceTextStyle = TextStyle(
    color: AppColors.salePrice,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle cartOptionTextStyle = TextStyle(
    color: AppColors.title,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle totalTextStyle = TextStyle(
    color: AppColors.title,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle ratingTextStyle = TextStyle(
    color: AppColors.title,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle totalCartTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 10,
    fontFamily: 'Montserrat',
  );
  static const TextStyle paymentTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const TextStyle dropDownTextStyle = TextStyle(
    color: AppColors.primary,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
  static const TextStyle dropDownTitleTextStyle = TextStyle(
    color: AppColors.dropdownText,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
}
