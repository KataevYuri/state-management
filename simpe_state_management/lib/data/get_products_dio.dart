//Получение списка товаров
//https://fakestoreapi.com/products
import 'package:dio/dio.dart';
import '../domain/models/product.dart';
import '../domain/models/products_list.dart';

class ProductsDIOData {
  Future<List> _getProductsData() async {
    final response = await Dio().get('https://fakestoreapi.com/products');
    final data = response.data as List<dynamic>;
    return data.map((e) => Product.fromJson(e)).toList();
  }

  ProductsList getProductsData() {
    final data = _getProductsData();
    ProductsList listProducts = [];
    data.then((value) {
      for (var item in value) {
        listProducts.add(item);
      }
    });
    return listProducts;
  }
}
