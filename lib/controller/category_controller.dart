import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/category_model.dart';

Future<List<Category>> fetchListCategory() async {
  final response =
      await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
  if (response.statusCode == 200) {
    // ignore: non_constant_identifier_names
    Iterable JObj = jsonDecode(response.body);
    return List<Category>.from(JObj.map((e) => Category.fromJson(e)));
  } else {
    throw Exception('Failed to load Product');
  }
}
