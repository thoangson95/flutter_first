import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductStatus { loading, liked, dislike }

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

  // All properties should be `final` on our class.
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

  // Since ProductModel is immutable, we implement a method that allows cloning the
  // ProductModel with slightly different content.
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
        idList,
      ];
}

class ProductState {
  final List<ProductModel>? listProducts;
  final bool isLoading;

  ProductState({this.listProducts, this.isLoading = true});

  ProductState copyWith({List<ProductModel>? listProducts, bool? isLoading}) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      listProducts: listProducts ?? this.listProducts,
    );
  }
}

final productProviders = StateNotifierProvider<ProductControler, ProductState>(
  (ref) => ProductControler(),
);

class ProductControler extends StateNotifier<ProductState> {
  ProductControler() : super(ProductState()) {
    _init();
  }

  _init() async {
    final List<ProductModel>? a = await fetchProducts();
    state = state.copyWith(listProducts: a);
  }

  Future<List<ProductModel>?> fetchProducts() async {
    final dio = Dio();

    final response =
        await dio.get('http://demo41.ninavietnam.com.vn/api/product');

    final data = json.decode(response.data) as List<dynamic>;

    return data
        .map(
          (product) => ProductModel(
            id: product['id'],
            code: product['code'],
            namevi: product['namevi'],
            descvi: product['descvi'],
            photo: product['photo'],
            regularPrice: product['regular_price'],
            salePrice: product['sale_price'],
            discount: product['discount'],
            status: product['status'],
            idList: product['id_list'],
          ),
        )
        .toList();
  }

  // void toggleFavorite(int id, String like) async {
  //   state = state.copyWith(isLoading: true);
  //   if (like.isNotEmpty) {
  //     List<ProductModel> newList = [];
  //     for (var element in state.listProducts!) {
  //       if (int.parse(element.id.toString()) == id) {
  //         element = element.copyWith(status: '');
  //       }
  //       newList.add(element);
  //     }
  //     await putData('/product', {'id': id, 'like': ''});
  //     state = state.copyWith(listProducts: newList, isLoading: false);
  //   } else {
  //     List<ProductModel> newList = [];
  //     for (var element in state.listProducts!) {
  //       if (int.parse(element.id.toString()) == id) {
  //         element = element.copyWith(status: 'like');
  //       }
  //       newList.add(element);
  //     }
  //     await putData('/product', {'id': id, 'like': 'like'});
  //     state = state.copyWith(listProducts: newList, isLoading: false);
  //   }
  // }
}
