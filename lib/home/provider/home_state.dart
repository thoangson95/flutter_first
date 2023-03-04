import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/home_model.dart';

final productState = StateProvider<List<ProductModel>?>((ref) => []);

final httpState =
    StateProvider<String>((ref) => "http://demo39.ninavietnam.com.vn/test1/");
