import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/products_model.dart';

class ProductsRepository {
  static const String _baseUrl =
      'https://demo55.ninavietnam.com.vn/flutter/api';
  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  static Future<List<ProductsModel>?> resultsProducts() async {
    final response = await _dio.get('/product');

    final data = json.decode(response.data) as List<dynamic>;

    final List<ProductsModel> productItem = [];

    if (response.statusCode == 200) {
      for (var p in data) {
        productItem.add(ProductsModel.fromJson(p));
      }
      return productItem;
    } else {
      throw Exception('Failed to load product');
    }
  }
}
