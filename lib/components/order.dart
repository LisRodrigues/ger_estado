// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:ger_estado/models/order.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
                'R\$ ${widget.order.total.toStringAsFixed(2)}'), //toStringAsFixed() fixa a quantidade de casas decimais que serão mostradas
            subtitle: Text(
              DateFormat("dd/MM/yyyy hh:mm").format(widget.order.date),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: (widget.order.produtos.length * 25.0) + 10,
              child: ListView(
                  children: widget.order.produtos.map(
                (produtos) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        produtos.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${produtos.quantity}x R\$ ${produtos.price}",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )
                    ],
                  );
                },
              ).toList()),
            )
        ],
      ),
    );
  }
}
