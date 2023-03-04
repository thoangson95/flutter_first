import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

import '../model/home_model.dart';

Future<List<ProductModel>> getProductList() async {
  final response = await http
      .post(Uri.parse("http://demo39.ninavietnam.com.vn/test1/product"));
  if (response.statusCode == 200) {
    List jsonRaw = jsonDecode(response.body);
    List<ProductModel> data =
        jsonRaw.map((e) => ProductModel.fromJson(e)).toList();
    return data;
  } else {
    throw Exception("Lỗi kết nối tới server");
  }
}

final fListProductProvider = FutureProvider<List<ProductModel>>((ref) async {
  return getProductList();
});
