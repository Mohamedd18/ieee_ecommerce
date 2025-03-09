import 'package:dio/dio.dart';

import '../api/Product.dart';

class ApiManger {
  Dio dio = Dio();

  Future<List<Product>> getProducts() async {
    final response = await dio.get('https://api.escuelajs.co/api/v1/products');

    List<dynamic> data = response.data;

    return data.map((prodcut) => Product.fromJson(prodcut)).toList();
  }
}
