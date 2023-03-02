import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/product_repository.dart';

class ProductDetailModel extends Equatable {
  const ProductDetailModel({
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
    this.gallery,
    this.color,
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
  final List<dynamic>? gallery;
  final List<dynamic>? color;

  ProductDetailModel copyWith({
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
    List<dynamic>? gallery,
    List<dynamic>? color,
  }) {
    return ProductDetailModel(
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
      gallery: gallery ?? this.gallery,
      color: color ?? this.color,
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
        gallery,
        color
      ];
}

class ProductDetailState {
  final List<dynamic>? listProducts;
  final bool isLoading;

  ProductDetailState({this.listProducts, this.isLoading = true});

  ProductDetailState copyWith(
      {List<ProductDetailModel>? listProducts, bool? isLoading}) {
    return ProductDetailState(
        isLoading: isLoading ?? this.isLoading,
        listProducts: listProducts ?? this.listProducts);
  }
}

class ProductDetailControler extends StateNotifier<ProductDetailState> {
  ProductDetailControler() : super(ProductDetailState()) {
    _init();
  }

  _init() async {
    final ProductDetailModel a = await ApiService.fetchProduct(139);
    state = state.copyWith(listProducts: [a]);
  }
}

final productDetailProviders =
    StateNotifierProvider<ProductDetailControler, ProductDetailState>(
  (ref) => ProductDetailControler(),
);
