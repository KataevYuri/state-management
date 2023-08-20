import 'package:flutter/material.dart';

import '../../domain/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.card,
  });

  final Product card;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        SizedBox(height: 100, width: 100, child: Image.network(card.imageUrl)),
        Text(card.title),
        Text('${card.price}'),
      ]),
    );
  }
}
