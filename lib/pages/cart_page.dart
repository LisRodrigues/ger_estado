// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              children: [
                Text("Total", style: TextStyle(fontSize: 20)),
                Chip(
                    label: Text(
                  "R\$1000",
                  style: TextStyle(
                      color:
                          Theme.of(context).primaryTextTheme.headline6?.color),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
