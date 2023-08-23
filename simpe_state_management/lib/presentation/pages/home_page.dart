import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/providers/ssm_provider.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';
import 'package:simpe_state_management/presentation/widgets/product_card.dart';

ProductsList pl = [];

getData() async {
  pl = await ProductsRepository().getProducts();
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин барахла https://fakestoreapi.com/'),
      ),
      body: pl.isNotEmpty
          ? FutureBuilder(
              future: getData(),
              builder: (context, snapshot) => Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: pl.length,
                      itemBuilder: (context, index) {
                        return ProductCard(card: pl[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () => context.read<CounterInCart>().clear(),
                      child: Consumer<CounterInCart>(
                        builder: (context, state, child) =>
                            Text('Товаров в корзине: ${snapshot.data}'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Загрузка данных...'),
                  SizedBox(height: 10),
                  CircularProgressIndicator(),
                ],
              ),
            ),
    );
  }
}
