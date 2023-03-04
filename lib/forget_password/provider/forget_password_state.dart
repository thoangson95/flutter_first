import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/forget_password_model.dart';
import '../repository/forget_password_repository.dart';

class ForgetPasswordStates {
  final List<ForgetPasswordModel>? listProducts;
  final bool isLoading;

  ForgetPasswordStates({this.listProducts, this.isLoading = true});

  ForgetPasswordStates copyWith(
      {List<ForgetPasswordModel>? listProducts, bool? isLoading}) {
    return ForgetPasswordStates(
        isLoading: isLoading ?? this.isLoading,
        listProducts: listProducts ?? this.listProducts);
  }
}

class ForgetPasswordControler extends StateNotifier<ForgetPasswordStates> {
  ForgetPasswordControler() : super(ForgetPasswordStates()) {
    _init();
  }

  _init() async {
    final List<ForgetPasswordModel>? a =
        await ForgetPasswordRepository.resultsProducts();
    state = state.copyWith(listProducts: a);
  }
}

final productProviders =
    StateNotifierProvider<ForgetPasswordControler, ForgetPasswordStates>(
  (ref) => ForgetPasswordControler(),
);
