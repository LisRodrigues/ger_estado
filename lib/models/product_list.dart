import 'package:flutter/cupertino.dart';
import 'package:ger_estado/data/dummy_data.dart';
import 'package:ger_estado/models/produtos.dart';

class ProductList with ChangeNotifier {
  List<produto> _items = dummyProdutos;

  List<produto> get items => [..._items];

  void addProdutos(produto Produto) {
    _items.add(Produto);
    notifyListeners();
  }
}
