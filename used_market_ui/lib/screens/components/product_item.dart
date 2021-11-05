import 'package:carrot_market_ui/models/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.urlToImage,
              height: 115,
              width: 115,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // ProductDetail(product: product),
        ],
      ),
    );
  }
}
