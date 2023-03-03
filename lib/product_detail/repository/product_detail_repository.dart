import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/product_detail_model.dart';

class ProductDetailRepository {
  static const String _baseUrl =
      'https://demo55.ninavietnam.com.vn/flutter/api';
  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  static Future<List<ProductDetailModel>?> fetchProduct(String id) async {
    final response = await _dio.get('/product?id=$id');

    final data = json.decode(response.data) as List<dynamic>;

    final List<ProductDetailModel> productItem = [];

    if (response.statusCode == 200) {
      for (var p in data) {
        productItem.add(ProductDetailModel.fromJson(p));
      }
      return productItem;
    } else {
      throw Exception('Failed to load product');
    }
  }
}
