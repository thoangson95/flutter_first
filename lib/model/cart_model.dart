import 'package:thoitrang/model/product_model.dart';

class CartModel {
  int? qty;
  String? code;
  bool selected;
  ProductModel? productDetail;

  CartModel({this.qty, this.code, this.productDetail, this.selected = false});

  // CartModel.fromJson(Map<String, dynamic> json) {
  //   qty = json['qty'];
  //   code = json['code'];
  //   total = 0;
  //   productDetail = json['product_detail'] != null
  //       ? ProductModel.fromJson(json['product_detail'])
  //       : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['qty'] = qty;
  //   data['code'] = code;
  //   if (productDetail != null) {
  //     data['product_detail'] = productDetail!.toJson();
  //   }
  //   return data;
  // }
}
