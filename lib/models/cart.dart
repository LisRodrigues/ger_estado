// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:ger_estado/models/cart_item.dart';
import 'package:ger_estado/models/produtos.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }

  void addItem(produto produt) {
    if (_items.containsKey(produt.id)) {
      _items.update(
        produt.id,
        (existingItem) => CartItem(
            id: existingItem.id,
            productId: existingItem.productId,
            name: existingItem.name,
            quantity: existingItem.quantity + 1,
            price: existingItem.price),
      );
    } else {
      _items.putIfAbsent(
          produt.id,
          () => CartItem(
              id: Random().nextDouble().toString(),
              productId: produt.id,
              name: produt.name,
              quantity: 1,
              price: produt.price));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
