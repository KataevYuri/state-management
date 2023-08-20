import 'package:dio/dio.dart';
import 'package:simpe_state_management/domain/models/product.dart';
import 'package:simpe_state_management/domain/models/products_list.dart';

class ProductsRepository {
  Future<ProductsList> getProducts() async {
    final response = await Dio().get('https://fakestoreapi.com/products');
    final data = response.data as List<dynamic>;
    return ProductsList(
      data.map((e) => Product.fromJson(e)).toList(),
    );
  }
}
