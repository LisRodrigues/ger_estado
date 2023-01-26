// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ger_estado/models/produtos.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final produto product =
        ModalRoute.of(context)?.settings.arguments as produto;
    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "R\$ ${product.price}",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  product.description,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
