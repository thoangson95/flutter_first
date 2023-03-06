import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/home_banner_model.dart';
import '../model/home_categories_model.dart';
import '../model/home_product_model.dart';

class HomeRepository {
  static const String _baseUrl =
      'https://demo55.ninavietnam.com.vn/flutter/api';
  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  static Future<List<HomeProductModel>?> homeProduct() async {
    final response = await _dio.get('/product');
    final data = json.decode(response.data) as List<dynamic>;
    if (response.statusCode == 200) {
      return data
          .map(
            (product) => HomeProductModel(
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
      throw Exception('Failed to load Product');
    }
  }

  static Future<List<HomeBannerModel>?> homeBanner() async {
    final response = await _dio.get('/banner');
    final data = json.decode(response.data) as List<dynamic>;
    if (response.statusCode == 200) {
      return data
          .map(
            (product) => HomeBannerModel(
              id: product['id'],
              namevi: product['namevi'],
              photo: product['photo'],
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to load Banner');
    }
  }

  static Future<List<HomeCategoriesModel>?> homeCategories() async {
    final response = await _dio.get('/categories');
    final data = json.decode(response.data) as List<dynamic>;
    if (response.statusCode == 200) {
      return data
          .map(
            (product) => HomeCategoriesModel(
              id: product['id'],
              namevi: product['namevi'],
              photo: product['photo'],
            ),
          )
          .toList();
    } else {
      throw Exception('Failed to load Categories');
    }
  }

  static Future<List> appInfo() async {
    final response = await _dio.get('/app-info');
    final data = json.decode(response.data);
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception('Failed to load App Info');
    }
  }
}
