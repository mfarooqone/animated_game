import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyle {
  ///////////////////////////////////////////////
  ///      White
  ///////////////////////////////////////////////
  static TextStyle bodySmall = TextStyle(
    color: AppColors.white,
    fontSize: 4.0.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.roboto,
  );
  static TextStyle bodyMedium = TextStyle(
    color: AppColors.white,
    fontSize: 6.0.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.roboto,
  );
  static TextStyle bodyLarge = TextStyle(
    color: AppColors.white,
    fontSize: 8.0.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.roboto,
  );

  ///
  ///
  ///
  static TextStyle headlineSmall = TextStyle(
    color: AppColors.white,
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.roboto,
  );
  static TextStyle headlineMedium = TextStyle(
    color: AppColors.white,
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.roboto,
  );
  static TextStyle headlineLarge = TextStyle(
    color: AppColors.white,
    fontSize: 22.0.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.roboto,
  );
}
