import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/model/product_state_model.dart';
import 'package:thoitrang/network/shared_provider.dart';

class ProductsNotifier extends StateNotifier<ProductStateModel> {
  ProductsNotifier({required this.ref}) : super(ProductStateModel()) {
    fetchListProduct(ref: ref);
  }
  final Ref ref;

  Future fetchListProduct({required Ref ref}) async {
    await ref.read(productControllerPorvider).fetchListProduct().then((value) {
      state = state.copyWith(data: value);
      state = state.copyWith(isLoading: false);
    });
  }
}
