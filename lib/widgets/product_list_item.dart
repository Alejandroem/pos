import 'package:flutter/material.dart';
import 'package:pos/domain/models/product_model.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image(
            image: NetworkImage(
              product.thumbnail,
            ),
            width: 100,
          ),
          Text(product.name,
              style: const TextStyle(
                color: Colors.black,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${product.quantityUnits} ${product.quantityMeasure}',
                  style: const TextStyle(
                    color: Colors.black,
                  )),
              Text('${product.price}',
                  style: const TextStyle(
                    color: Colors.black,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
