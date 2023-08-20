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
    return ListTile(
      selectedTileColor: Colors.amber,
      onTap: () {},
      selectedColor: Colors.blue,
      leading: Image.network(
        card.imageUrl,
        width: 100,
      ),
      trailing: const Icon(Icons.shopping_bag),
      title: Text(card.title),
      subtitle: Text(
        'Цена: ${card.price}',
        style: const TextStyle(
            color: Colors.red, fontWeight: FontWeight.w900, fontSize: 16),
      ),
    );
  }
}
