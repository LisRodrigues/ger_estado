// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:ger_estado/components/app_drawer.dart';
import 'package:ger_estado/components/order.dart';
import 'package:ger_estado/models/order_list.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList order = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Meus pedidos"),
        ),
        drawer: AppDrawer(),
        body: ListView.builder(
            itemCount: order.itemsCount,
            itemBuilder: (ctx, i) => OrderWidget(order: order.items[i])));
  }
}
