import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpe_state_management/domain/providers/ssm_provider.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';
import 'package:simpe_state_management/presentation/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late var productsList = [];

  @override
  void initState() {
    super.initState();
    productsList = ProductsRepository().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Магазин барахла https://fakestoreapi.com/'),
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //     onPressed: () {},
        //     label: Consumer<CounterInCart>(
        //         builder: (context, state, child) =>
        //             Text('В корзине ${state.value} товаров')),
        //     icon: const Icon(
        //       Icons.shopping_cart,
        //     )),
        body: productsList.isNotEmpty
            ? ListView.builder(
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  return ProductCard(card: productsList[index]);
                },
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
