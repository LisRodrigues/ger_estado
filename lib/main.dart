// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ger_estado/models/cart.dart';
import 'package:ger_estado/models/order_list.dart';
import 'package:ger_estado/models/product_list.dart';
import 'package:ger_estado/pages/cart_page.dart';
import 'package:ger_estado/pages/orders_page.dart';
import 'package:ger_estado/pages/podutos_overview_page.dart';
import 'package:ger_estado/pages/product_detaill_page.dart';
import 'package:ger_estado/pages/product_page.dart';
import 'package:ger_estado/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
            fontFamily: 'Lato'),
        //home: ProdutosOverviewPage(),
        routes: {
          AppRoutes.HOME: (ctx) => ProdutosOverviewPage(),
          AppRoutes.PRODUCT_DETAILS: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartPage(),
          AppRoutes.ORDERS: (ctx) => OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => ProductsPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
