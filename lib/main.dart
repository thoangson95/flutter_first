import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thoitrang/main/screen/main_screen.dart';
import 'package:flutter_thoitrang/product/model/product_card_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'cart/model/cart_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  Hive.registerAdapter(ProductCardModelAdapter());

  await Hive.openBox<CartModel>('CartBox');
  await Hive.openBox<ProductCardModel>('ProductFavoriteBox');

  runApp(const ProviderScope(child: MainScreen()));
}
