import 'package:thoitrang/model/product_model.dart';

class ProductStateModel {
  late bool isLoading;
  List<ProductModel>? data;

  ProductStateModel({this.isLoading = false, this.data});

  ProductStateModel copyWith({bool? isLoading, List<ProductModel>? data}) {
    return ProductStateModel(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }

  ProductStateModel.fromJson(Map<String, dynamic> json) {
    isLoading = json['isLoading'];
    if (json['data'] != null) {
      data = <ProductModel>[];
      json['data'].forEach((v) {
        data!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isLoading'] = isLoading;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
