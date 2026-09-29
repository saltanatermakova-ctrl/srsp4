import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Демонстрационный товар (без базы данных).
class Product {
  final int id;
  final String nameKey; // ключ локализации
  final int price;
  final IconData icon;
  final Color color;

  const Product({
    required this.id,
    required this.nameKey,
    required this.price,
    required this.icon,
    required this.color,
  });
}

const List<Product> products = [
  Product(id: 1, nameKey: 'product_1', price: 349900, icon: Icons.smartphone, color: AppColors.primary),
  Product(id: 2, nameKey: 'product_2', price: 599900, icon: Icons.laptop_mac, color: AppColors.teal),
  Product(id: 3, nameKey: 'product_3', price: 49900, icon: Icons.headphones, color: AppColors.orange),
  Product(id: 4, nameKey: 'product_4', price: 89900, icon: Icons.watch, color: AppColors.purple),
  Product(id: 5, nameKey: 'product_5', price: 279900, icon: Icons.photo_camera, color: AppColors.pink),
  Product(id: 6, nameKey: 'product_6', price: 199900, icon: Icons.tablet_mac, color: AppColors.indigo),
  Product(id: 7, nameKey: 'product_7', price: 34900, icon: Icons.speaker, color: AppColors.green),
  Product(id: 8, nameKey: 'product_8', price: 29900, icon: Icons.keyboard, color: AppColors.brown),
];

/// 349900 -> "349 900"
String formatPrice(int value) {
  final s = value.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buffer.write(' ');
    buffer.write(s[i]);
  }
  return buffer.toString();
}
