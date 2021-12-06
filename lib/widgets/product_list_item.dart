import 'package:flutter/material.dart';
import 'package:pos/domain/models/product_model.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        product.name,
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
