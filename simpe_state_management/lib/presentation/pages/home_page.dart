import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpe_state_management/domain/providers/ssm_provider.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';
import 'package:simpe_state_management/presentation/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин барахла https://fakestoreapi.com/'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Consumer<CounterInCart>(
              builder: (context, state, child) =>
                  Text('В корзине ${state.value} товаров')),
          icon: const Icon(
            Icons.shopping_cart,
          )),
      body: FutureBuilder(
        future: ProductsRepository().getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data.products.length,
              itemBuilder: (context, index) {
                return ProductCard(card: snapshot.data.products[index]);
              },
            );
          }
        },
      ),
    );
  }
}
