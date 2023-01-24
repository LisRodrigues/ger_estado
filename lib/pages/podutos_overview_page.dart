// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ger_estado/components/products_item.dart';
import 'package:ger_estado/data/dummy_data.dart';
import 'package:ger_estado/models/produtos.dart';

class ProdutosOverviewPage extends StatelessWidget {
  final List<produto> loadedProdutos = dummyProdutos;

  ProdutosOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Minha loja")),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        //é preciso dizer a quantidade de itens que ele vai renderizar
        itemCount: loadedProdutos.length,
        //Diz como vai ser construida casa coisa do gridview
        itemBuilder: (ctx, i) => ProdutoItem(product: loadedProdutos[i]),
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
      ),
    );
  }
}
