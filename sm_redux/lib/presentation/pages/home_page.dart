import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/providers/sm_provider.dart';
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
      body: StreamBuilder<ProductsList>(
        stream: ProductsRepository().getProducts(),
        builder: (BuildContext context, AsyncSnapshot<ProductsList> snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ProductCard(card: snapshot.data![index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: StoreConnector<CartState, ViewModel>(
                    converter: ViewModel.fromStore,
                    builder: (context, vm) {
                      return ElevatedButton(
                          onPressed: vm.onClear,
                          child: Text('Товаров в корзине: ${vm.value}'));
                    }),
              )
            ]);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Загрузка данных...'),
                  SizedBox(height: 10),
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
