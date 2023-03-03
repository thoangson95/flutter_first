import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/product_card_model.dart';

class ProductState extends ChangeNotifier {
  var box = Hive.box<ProductCardModel>('ProductFavoriteBox');

  void toggleFav({required ProductCardModel model}) {
    final idx = box.values.toList().indexWhere((e) => e.id == model.id);
    if (idx > -1) {
      box.deleteAt(idx);
    } else {
      box.add(model);
    }
  }

  bool checkFav({required int id}) {
    final idx = box.values.toList().indexWhere((e) => e.id == id);
    return (idx > -1);
  }
}
