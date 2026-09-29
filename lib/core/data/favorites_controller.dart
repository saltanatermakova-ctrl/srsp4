import 'package:flutter/material.dart';

/// Список id товаров в избранном.
class FavoritesController {
  FavoritesController._();
  static final FavoritesController instance = FavoritesController._();

  final ValueNotifier<Set<int>> ids = ValueNotifier<Set<int>>(<int>{});

  void toggle(int id) {
    final next = Set<int>.from(ids.value);
    if (!next.add(id)) {
      next.remove(id);
    }
    ids.value = next;
  }
}
