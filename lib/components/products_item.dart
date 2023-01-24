import 'package:flutter/material.dart';
import 'package:ger_estado/models/produtos.dart';

class ProdutoItem extends StatelessWidget {
  final produto product;

  const ProdutoItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Text(product.title);
  }
}
