// ignore_for_file: prefer_const_constructors, sort_child_properties_last, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ger_estado/components/app_drawer.dart';
import 'package:ger_estado/components/badge.dart';
import 'package:ger_estado/components/product_grid.dart';
import 'package:ger_estado/models/cart.dart';
import 'package:ger_estado/utils/app_routes.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  favorite,
  All,
}

class ProdutosOverviewPage extends StatefulWidget {
  const ProdutosOverviewPage({super.key});

  @override
  State<ProdutosOverviewPage> createState() => _ProdutosOverviewPageState();
}

class _ProdutosOverviewPageState extends State<ProdutosOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha loja"),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOptions.favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART);
                },
                icon: Icon(Icons.shopping_cart)),
            builder: (ctx, cart, child) =>
                Badge(value: cart.itemsCount.toString(), child: child!),
          ),
        ],
      ),
      body: ProductGrid(
        _showFavoriteOnly,
      ),
      drawer: AppDrawer(),
    );
  }
}
