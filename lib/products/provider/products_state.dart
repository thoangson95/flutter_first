import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/products_model.dart';
import '../repository/products_repository.dart';

class ProductsStates {
  final List<ProductsModel>? listProducts;
  final bool isLoading;

  ProductsStates({this.listProducts, this.isLoading = true});

  ProductsStates copyWith(
      {List<ProductsModel>? listProducts, bool? isLoading}) {
    return ProductsStates(
        isLoading: isLoading ?? this.isLoading,
        listProducts: listProducts ?? this.listProducts);
  }
}

class ProductControler extends StateNotifier<ProductsStates> {
  ProductControler() : super(ProductsStates()) {
    _init();
  }

  _init() async {
    final List<ProductsModel>? a = await ProductsRepository.resultsProducts();
    state = state.copyWith(listProducts: a);
  }
}

final productProviders =
    StateNotifierProvider<ProductControler, ProductsStates>(
  (ref) => ProductControler(),
);
