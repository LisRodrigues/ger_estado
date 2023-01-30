// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ger_estado/models/cart.dart';
import 'package:ger_estado/models/cart_item.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      //dislize do card
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        // ignore: sort_child_properties_last
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Tem certeza ?"),
                  content: Text('Quer remover esse item do carrinho ?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text("Não")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text("Sim"))
                  ],
                ));
      },
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem.productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FittedBox(
                child: Text("${cartItem.price}"),
              ),
            ),
          ),
          title: Text(cartItem.name),
          subtitle: Text("Total: R\$ ${cartItem.price * cartItem.quantity}"),
          trailing: Text("${cartItem.quantity}x"),
        ),
      ),
    );
  }
}
