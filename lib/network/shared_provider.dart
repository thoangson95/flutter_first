import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:thoitrang/controller/cart_controller.dart';
import 'package:thoitrang/controller/product_contronller.dart';
import 'package:thoitrang/model/product_model.dart';

Future<PersistCookieJar> prepareJar() async {
  final Directory appDocDir = await getApplicationDocumentsDirectory();
  final String appDocPath = appDocDir.path;
  final jar = PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage("$appDocPath/.cookies/"),
  );
  return jar;
}

final dio = Provider((ref) {
  return Dio();
});

final productControllerPorvider = Provider((ref) {
  return ProductController(ref.read(dio));
});

final getProductProvider = FutureProvider<List<ProductModel>>((ref) async {
  return await ProductController(ref.read(dio)).fetchListProduct();
});

final cartProvider =
    ChangeNotifierProvider<CartController>((ref) => CartController());
