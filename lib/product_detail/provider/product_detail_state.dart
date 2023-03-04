import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/product_detail/repository/product_detail_repository.dart';

import '../model/product_detail_model.dart';

class ProductDetailState {
  final List<ProductDetailModel>? productItem;
  final bool isLoading;

  ProductDetailState({this.productItem, this.isLoading = true});

  ProductDetailState copyWith(
      {List<ProductDetailModel>? productItem, bool? isLoading}) {
    return ProductDetailState(
        isLoading: isLoading ?? this.isLoading,
        productItem: productItem ?? this.productItem);
  }
}

class ProductDetailControler extends StateNotifier<ProductDetailState> {
  ProductDetailControler() : super(ProductDetailState());

  init(String id) async {
    final List<ProductDetailModel>? a =
        await ProductDetailRepository.fetchProduct(id);

    state = state.copyWith(productItem: a, isLoading: false);
  }
}

final productDetailProviders = StateNotifierProvider.autoDispose<
    ProductDetailControler, ProductDetailState>(
  (ref) => ProductDetailControler(),
);
