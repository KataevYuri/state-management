import 'package:flutter/material.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';

import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool isLoading = true;

  //late ProductsList products;

  @override
  initState() {
    super.initState();

    // as ProductsList;
    //isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fake Shop'),
        ),
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
        ));
  }
}
