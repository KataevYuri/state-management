import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:simpe_state_management/domain/providers/ssm_provider.dart';
import 'package:simpe_state_management/domain/repositories/products_repository.dart';
import 'package:simpe_state_management/presentation/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pl = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    pl = await ProductsRepository().getProducts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Магазин барахла https://fakestoreapi.com/'),
        ),
        body: pl.isNotEmpty
            ? Column(
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
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('Товаров в корзине: 0'),
                    ),
                  )
                ],
              )
            : const Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Загрузка данных...'),
                  SizedBox(height: 10),
                  CircularProgressIndicator(),
                ],
              )));
  }
}
