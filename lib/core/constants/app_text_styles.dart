import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

/// Текстовые стили приложения (размеры адаптивные, через .sp).
/// Цвет основного текста берётся из темы, поэтому стили работают
/// и в светлой, и в тёмной теме.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get title => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get subtitle => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get body => TextStyle(
        fontSize: 16.sp,
      );

  static TextStyle get caption => TextStyle(
        fontSize: 14.sp,
        color: AppColors.textSecondary,
      );

  static TextStyle get price => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      );
}
