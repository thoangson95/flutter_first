import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thoitrang/controller/product.dart';

class FavoriteState {
  final bool isFav;

  FavoriteState({required this.isFav});

  FavoriteState copyWith({required bool isFav}) {
    return FavoriteState(isFav: isFav);
  }
}

final favoriteStateProvider =
    StateNotifierProvider.autoDispose<FavoriteStateController, FavoriteState>(
        (ref) {
  return FavoriteStateController();
});

class FavoriteStateController extends StateNotifier<FavoriteState> {
  FavoriteStateController() : super(FavoriteState(isFav: false));

  void toggleFavorite(int id, String like) async {
    if (like.isNotEmpty) {
      state = state.copyWith(isFav: false);
      await putData('/product', {'id': id, 'like': ''});
    } else {
      state = state.copyWith(isFav: true);
      await putData('/product', {'id': id, 'like': 'like'});
    }
  }
}
