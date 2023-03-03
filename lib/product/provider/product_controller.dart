import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/dio_exception_model.dart';
import '../model/product_card_model.dart';
import 'product_state.dart';

class ProductController {
  final Dio dio;
  ProductController(this.dio);

  Future<List<ProductCardModel>> fetchListProductCard() async {
    try {
      final response = await dio.get(
          "http://demo80.ninavietnam.com.vn/test_app_api/api/product_api.php?type=getProduct");
      return (jsonDecode(response.data) as List)
          .map((e) => ProductCardModel.fromJson(e))
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

final productCardProvider = FutureProvider<List<ProductCardModel>>(
    (ref) => ProductController(ref.watch(dioProvider)).fetchListProductCard());

final productState = ChangeNotifierProvider((ref) => ProductState());
