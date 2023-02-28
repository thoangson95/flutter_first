import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:thoitrang/model/cart_model.dart';
import 'package:thoitrang/model/product_model.dart';

class CartController extends ChangeNotifier {
  List<CartModel> listCart = <CartModel>[];
  double total = 0;
  int maxQty = 0;
  bool isSelectAll = false;

  void addToCart({required ProductModel addItem, required int qty}) {
    int idx =
        listCart.indexWhere((e) => (e.productDetail?.id ?? 0) == addItem.id);
    if (idx > -1) {
      listCart[idx].qty = (listCart[idx].qty ?? 0) + qty;
    } else {
      String code = md5
          .convert(utf8.encode("${addItem.id}${addItem.dateCreated}$qty"))
          .toString();
      listCart.add(CartModel(code: code, productDetail: addItem, qty: qty));
    }
    caculateTotalAndMaxQty();
    notifyListeners();
  }

  void removeFromCart({required String code, required int qty}) {
    int idx = listCart.indexWhere((e) => (e.code ?? '') == code);
    if (idx > -1) {
      total -= (listCart[idx].productDetail?.regularPrice ?? 0) * qty;
      maxQty -= qty;
      if (((listCart[idx].qty ?? 0) - qty) > 0) {
        listCart[idx].qty = (listCart[idx].qty ?? 0) - qty;
      } else {
        listCart.remove(listCart[idx]);
      }
      caculateTotalAndMaxQty();
      notifyListeners();
    }
  }

  void selectItem({required String code}) {
    int idx = listCart.indexWhere((e) => (e.code ?? '') == code);
    if (idx > -1) {
      listCart[idx].selected = !listCart[idx].selected;
      caculateTotalAndMaxQty();
      notifyListeners();
    }
  }

  void selecteAll() {
    for (int i = 0; i < listCart.length; i++) {
      listCart[i].selected = !isSelectAll;
    }
    isSelectAll = !isSelectAll;
    caculateTotalAndMaxQty();
    notifyListeners();
  }

  void caculateTotalAndMaxQty() {
    total = 0;
    maxQty = 0;
    for (var e in listCart) {
      if (e.selected) {
        total += (e.productDetail?.regularPrice ?? 0) * (e.qty ?? 0);
        maxQty += (e.qty ?? 0);
      }
    }
  }
}
