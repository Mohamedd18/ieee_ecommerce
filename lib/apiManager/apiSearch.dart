import 'package:dio/dio.dart';

import '../api/Product.dart';

class ApiSearch {
  Dio dio = Dio();
  final String productName;

  ApiSearch({required this.productName});

  Future<List<Product>> getProducts() async {
    final response = await dio.get('https://api.escuelajs.co/api/v1/products');

    List<dynamic> data = response.data;

    return data
        .map((product) => Product.fromJson(product))
        .where((product) => product.title
            .toString()
            .toLowerCase()
            .contains(productName.toLowerCase()))
        .toList();
  }
}
