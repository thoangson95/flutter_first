import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/home_repository.dart';

class ProductModel extends Equatable {
  const ProductModel({
    this.id,
    this.code,
    this.namevi,
    this.descvi,
    this.photo,
    this.regularPrice,
    this.salePrice,
    this.discount,
    this.status,
    this.idList,
  });

  final String? id;
  final String? code;
  final String? namevi;
  final String? descvi;
  final String? photo;
  final String? regularPrice;
  final String? salePrice;
  final String? discount;
  final String? status;
  final String? idList;

  ProductModel copyWith({
    String? id,
    String? code,
    String? namevi,
    String? descvi,
    String? photo,
    String? regularPrice,
    String? salePrice,
    String? discount,
    String? status,
    String? idList,
  }) {
    return ProductModel(
      id: id ?? this.id,
      code: code ?? this.code,
      namevi: namevi ?? this.namevi,
      descvi: descvi ?? this.descvi,
      photo: photo ?? this.photo,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      discount: discount ?? this.discount,
      status: status ?? this.status,
      idList: idList ?? this.idList,
    );
  }

  @override
  List<Object?> get props => [
        id,
        code,
        namevi,
        descvi,
        photo,
        regularPrice,
        salePrice,
        discount,
        status,
        idList
      ];
}

class ProductState {
  final List<ProductModel>? listProducts;
  final bool isLoading;

  ProductState({this.listProducts, this.isLoading = true});

  ProductState copyWith({List<ProductModel>? listProducts, bool? isLoading}) {
    return ProductState(
        isLoading: isLoading ?? this.isLoading,
        listProducts: listProducts ?? this.listProducts);
  }
}

class ProductControler extends StateNotifier<ProductState> {
  ProductControler() : super(ProductState()) {
    _init();
  }

  _init() async {
    final List<ProductModel>? a = await ApiService.fetchProducts();
    state = state.copyWith(listProducts: a);
  }
}

final productProviders = StateNotifierProvider<ProductControler, ProductState>(
  (ref) => ProductControler(),
);
