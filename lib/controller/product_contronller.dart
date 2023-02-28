import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:thoitrang/model/product_model.dart';
import 'package:thoitrang/network/shared_provider.dart';

class ProductController {
  final Dio _dio;
  ProductController(this._dio);

  Future<List<ProductModel>> fetchListProduct() async {
    _dio.interceptors.add(CookieManager(await prepareJar()));

    final response = await _dio.get(
        "http://demo80.ninavietnam.com.vn/test_app_api/api/product_api.php?type=getProduct");
    if (response.statusCode == 200) {
      return (jsonDecode(response.data) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load Product');
    }
  }
}
