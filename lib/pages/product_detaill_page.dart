import 'package:flutter/material.dart';
import 'package:ger_estado/models/produtos.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final produto product =
        ModalRoute.of(context)?.settings.arguments as produto;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
    );
  }
}
