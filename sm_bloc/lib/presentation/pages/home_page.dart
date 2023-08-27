import 'package:flutter/material.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';
import 'package:simpe_state_management/domain/providers/sm_provider.dart';

import 'package:simpe_state_management/presentation/widgets/product_card.dart';

ProductsList pl = [];

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CounterInCartBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = CounterInCartBloc();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Магазин барахла https://fakestoreapi.com/'),
      ),
      body: StreamBuilder<int>(
        stream: bloc.state,
        builder: (_, snapshot) {
          snapshot.hasData
              ? Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: config.length,
                        itemBuilder: (context, index) {
                          return ProductCard(card: config[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () => provider.clear(),
                        child: Text('Товаров в корзине: $count'),
                      ),
                    ),
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
                  ),
                );
        },
      ),
    );
  }
}
