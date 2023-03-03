import 'dart:convert';
import 'package:dio/dio.dart';

import '../provider/product_state.dart';

class HomeRepository {
  static const String _baseUrl =
      'https://demo55.ninavietnam.com.vn/flutter/api';
  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  static Future<List<ProductModel>?> fetchProducts() async {
    final response = await _dio.get('/product');
    final data = json.decode(response.data) as List<dynamic>;
    if (response.statusCode == 200) {
      return data
          .map(
            (product) => ProductModel(
              id: product['id'],
              code: product['code'],
              namevi: product['namevi'],
              descvi: product['descvi'],
              photo: product['photo'],
              regularPrice: product['regular_price'],
              salePrice: product['sale_price'],
              discount: product['discount'],
              status: product['status'],
              idList: product['id_list'],
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to load product');
    }
  }

  // static Future<ProductDetailModel> fetchProduct(int id) async {
  //   final response = await _dio.get('/product/$id');

  //   final data = json.decode(response.data);

  //   if (response.statusCode == 200) {
  //     return ProductDetailModel(
  //       id: data[0]['id'],
  //       code: data[0]['code'],
  //       namevi: data[0]['namevi'],
  //       descvi: data[0]['descvi'],
  //       photo: data[0]['photo'],
  //       regularPrice: data[0]['regular_price'],
  //       salePrice: data[0]['sale_price'],
  //       discount: data[0]['discount'],
  //       status: data[0]['status'],
  //       idList: data[0]['id_list'],
  //       gallery: data[0]['gallery'],
  //       color: data[0]['color'],
  //     );
  //   } else {
  //     throw Exception('Failed to load product');
  //   }
  // }
}
