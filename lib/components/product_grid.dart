import 'package:flutter/material.dart';
import 'package:ger_estado/components/products_item.dart';
import 'package:ger_estado/models/product_list.dart';
import 'package:ger_estado/models/produtos.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<produto> loadedProdutos = provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      //é preciso dizer a quantidade de itens que ele vai renderizar
      itemCount: loadedProdutos.length,
      //Diz como vai ser construida casa coisa do gridview
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
          create: (_) => loadedProdutos[i], child: ProdutoItem()),
      //slivergride = Quando vc tem uma área dentro de algo rolável com uma quantidade fixa na linha. Basicamente, ele define uma estrutura com x elementos em cada linha
      // ignore: prefer_const_constructors
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
