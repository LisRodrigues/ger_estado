// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ger_estado/components/products_item.dart';
import 'package:ger_estado/models/product_list.dart';
import 'package:ger_estado/models/produtos.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductGrid(this.showFavoriteOnly, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<produto> loadedProdutos =
        showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      //é preciso dizer a quantidade de itens que ele vai renderizar
      itemCount: loadedProdutos.length,
      //Diz como vai ser construida casa coisa do gridview
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: loadedProdutos[i], child: ProdutoItem()),
      //slivergride = Quando vc tem uma área dentro de algo rolável com uma quantidade fixa na linha. Basicamente, ele define uma estrutura com x elementos em cada linha
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //Quantidade de itens por linha
          crossAxisCount: 2,
          //dimensão de cada elemento.Relação entre altura e largura
          childAspectRatio: 3 / 2,
          //espaçamento entre os itens
          crossAxisSpacing: 10,
          //espaçamento no eixo principal
          mainAxisSpacing: 10),
    );
  }
}
