import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ieee_ecommerce/api/Register.dart';

import '../api/Product.dart';

class ApiManger {
  Dio dio = Dio(
    BaseOptions(baseUrl: 'https://api.escuelajs.co/api/v1/'),
  );

  Future<List<Product>> getProducts() async {
    final response = await dio.get('products');

    List<dynamic> data = response.data;

    return data.map((prodcut) => Product.fromJson(prodcut)).toList();
  }

  Future<RegisterResponse?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post('users/', data: {
        "name": name,
        "email": email,
        "password": password,
        "avatar": "https://picsum.photos/800"
      });
      return RegisterResponse.fromJson(response.data);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      final accessToken = response.data['access_token'];
      final refreshToken = response.data['refresh_token'];

      print('Access Token: $accessToken');
      print('Refresh Token: $refreshToken');

      return accessToken;
    } catch (e) {
      log('Login Error: $e');
      return null;
    }
  }
}
