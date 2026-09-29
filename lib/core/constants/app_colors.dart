import 'package:flutter/material.dart';

/// Все основные цвета приложения.
class AppColors {
  AppColors._();

  // Светлая тема
  static const primary = Color(0xFF2196F3);
  static const primaryDark = Color(0xFF1565C0);
  static const background = Color(0xFFF5F5F5);
  static const surface = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
  static const white = Color(0xFFFFFFFF);

  // Тёмная тема
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkTextPrimary = Color(0xFFEEEEEE);
  static const darkTextSecondary = Color(0xFFB0B0B0);

  // Акценты
  static const favorite = Color(0xFFE53935);
  static const orange = Color(0xFFFB8C00);
  static const green = Color(0xFF43A047);
  static const purple = Color(0xFF8E24AA);
  static const teal = Color(0xFF00897B);
  static const indigo = Color(0xFF3949AB);
  static const pink = Color(0xFFD81B60);
  static const brown = Color(0xFF6D4C41);

  /// Цвет карточек в зависимости от текущей темы.
  static Color cardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSurface
        : surface;
  }
}
