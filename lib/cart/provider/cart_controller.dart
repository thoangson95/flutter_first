import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thoitrang/cart/provider/cart_state.dart';

final cartChangeProvider = ChangeNotifierProvider((ref) => CartState());
