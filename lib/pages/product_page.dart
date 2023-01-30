// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ger_estado/components/app_drawer.dart';
import 'package:ger_estado/models/product_list.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList produtcts = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciamento de Produtos"),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: produtcts.itemsCount,
            itemBuilder: (ctx, i) => Text(produtcts.items[i].name)),
      ),
    );
  }
}
