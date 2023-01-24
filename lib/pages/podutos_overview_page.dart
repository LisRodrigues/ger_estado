// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ger_estado/components/product_grid.dart';

class ProdutosOverviewPage extends StatelessWidget {
  const ProdutosOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Minha loja")),
      ),
      body: ProductGrid(),
    );
  }
}
