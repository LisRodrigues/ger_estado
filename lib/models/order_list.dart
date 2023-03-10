// ignore_for_file: prefer_final_fields

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ger_estado/models/cart.dart';
import 'package:ger_estado/models/order.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
        0,
        Order(
            id: Random().nextDouble().toString(),
            total: cart.totalAmount,
            produtos: cart.items.values.toList(),
            date: DateTime.now()));
    notifyListeners();
  }
}
