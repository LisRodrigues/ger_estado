// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ger_estado/models/cart.dart';
import 'package:ger_estado/models/produtos.dart';
import 'package:ger_estado/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProdutoItem extends StatelessWidget {
  const ProdutoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<produto>(context);
    final cart = Provider.of<Cart>(context);

    return ClipRRect(
      //arredondar o retangulo
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // ignore: sort_child_properties_last
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<produto>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                product.toggleFavorite();
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 12),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product);
            },
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.PRODUCT_DETAILS, arguments: product);
          },
        ),
      ),
    );
  }
}
