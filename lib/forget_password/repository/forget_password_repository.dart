import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/forget_password_model.dart';

class ForgetPasswordRepository {
  static const String _baseUrl =
      'https://demo55.ninavietnam.com.vn/flutter/api';
  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  static Future<List<ForgetPasswordModel>?> resultsProducts() async {
    final response = await _dio.get('/product');

    final data = json.decode(response.data) as List<dynamic>;

    final List<ForgetPasswordModel> productItem = [];

    if (response.statusCode == 200) {
      for (var p in data) {
        productItem.add(ForgetPasswordModel.fromJson(p));
      }
      return productItem;
    } else {
      throw Exception('Failed to load product');
    }
  }
}
