import 'dart:convert';

import 'package:thoitrang/model/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> fetchListProduct() async {
  final response = await http.get(Uri.parse(
      'http://demo80.ninavietnam.com.vn/test_app_api/api/product_api.php?type=getProduct'));
  if (response.statusCode == 200) {
    // ignore: non_constant_identifier_names
    Iterable JObj = jsonDecode(response.body);
    return List<ProductModel>.from(JObj.map((e) => ProductModel.fromJson(e)));
  } else {
    throw Exception('Failed to load Product');
  }
}
