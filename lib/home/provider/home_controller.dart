import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/category_model.dart';
import '../model/dio_exception_model.dart';
import '../model/home_product_model.dart';

class HomeController {
  final Dio dio;
  HomeController(this.dio);

  Future<List<CategoryModel>> fetchListCategory() async {
    final response = await dio.get(
        "http://demo80.ninavietnam.com.vn/test_app_api/api/product_api.php?type=getList");
    if (response.statusCode == 200) {
      return (jsonDecode(response.data) as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load Product');
    }
  }

  Future<List<HomeProductModel>> fetchListProductCard() async {
    try {
      final response = await dio.get(
          "http://demo80.ninavietnam.com.vn/test_app_api/api/product_api.php?type=getProduct");
      return (jsonDecode(response.data) as List)
          .map((e) => HomeProductModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  return dio;
});

final homeCategoryProvider = FutureProvider<List<CategoryModel>>(
    (ref) => HomeController(ref.watch(dioProvider)).fetchListCategory());

final homeProductCardProvider = FutureProvider<List<HomeProductModel>>(
    (ref) => HomeController(ref.watch(dioProvider)).fetchListProductCard());
