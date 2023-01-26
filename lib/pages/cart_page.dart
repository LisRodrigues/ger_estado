// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_local_variable

import 'package:flutter/material.dart';
import 'package:ger_estado/components/cart_item.dart';
import 'package:ger_estado/models/cart.dart';
import 'package:ger_estado/models/order_list.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      label: Text(
                        "R\$${cart.totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                ?.color),
                      )),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderList>(context, listen: false)
                          .addOrder(cart);
                      cart.clear();
                    },
                    child: Text("COMPRAR"),
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, i) => CartItemWidget(cartItem: items[i])))
        ],
      ),
    );
  }
}
