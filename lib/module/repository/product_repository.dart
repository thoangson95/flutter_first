import 'package:dio/dio.dart';
import 'package:thoitrang/module/model/product_model.dart';

class ApiService {
  static const String _baseUrl =
      'https://demo55.ninavietnam.com.vn/flutter/api/product';
  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  static Future<List<Product>> resultProducts() async {
    try {
      final response = await _dio.get('');
      final data = response.data as List<dynamic>;
      final products = data.map((item) => Product.fromJson(item)).toList();
      return products;
    } catch (error) {
      throw Exception('Lỗi $error');
    }
  }

  static Future<Product> fetchProduct(int id) async {
    final response = await _dio.get('/$id');
    if (response.statusCode == 200) {
      return Product.fromJson(response.data);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
