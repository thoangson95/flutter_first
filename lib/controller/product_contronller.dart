import 'dart:convert';

import 'package:thoitrang/model/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchListProduct() async {
  final response =
      await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
  if (response.statusCode == 200) {
    // ignore: non_constant_identifier_names
    Iterable JObj = jsonDecode(response.body);
    return List<Product>.from(JObj.map((e) => Product.fromJson(e)));
  } else {
    throw Exception('Failed to load Product');
  }
}
