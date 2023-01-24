// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ger_estado/models/product_list.dart';
import 'package:ger_estado/pages/podutos_overview_page.dart';
import 'package:ger_estado/pages/product_detaill_page.dart';
import 'package:ger_estado/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final theme = ThemeData();
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
            fontFamily: 'Lato'),
        home: ProdutosOverviewPage(),
        routes: {AppRoutes.PRODUCT_DETAILS: (ctx) => ProductDetailPage()},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
