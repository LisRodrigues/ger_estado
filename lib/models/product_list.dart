// ignore_for_file: non_constant_identifier_names, prefer_final_fields, unused_field

import 'package:flutter/cupertino.dart';
import 'package:ger_estado/data/dummy_data.dart';
import 'package:ger_estado/models/produtos.dart';

class ProductList with ChangeNotifier {
  List<produto> _items = dummyProdutos;

  List<produto> get items => [..._items];
  List<produto> get favoriteItems =>
      _items.where((produt) => produt.isFavorite).toList();

  void addProdutos(produto Produto) {
    _items.add(Produto);
    notifyListeners();
  }
}

//bool _showFavoriteOnly = false;

//  List<produto> get items {
//    if (_showFavoriteOnly) {
//      return _items.where((produt) => produt.isFavorite).toList();
//    }
//    return [..._items];
//  }

//  void showFavoriteOnly() {
//    _showFavoriteOnly = true;
//    notifyListeners();
// }

//  void showAll() {
//    _showFavoriteOnly = false;
//    notifyListeners();
//  }
