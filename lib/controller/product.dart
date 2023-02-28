import '../models/product_model.dart';
import 'api.dart';

final apiProvider = ApiProvider();

Future<List<ProductModel>> resultData(String url) async {
  final List<ProductModel> list = [];
  final data = await apiProvider.get(url);
  var dataProducts = data as List;
  for (var element in dataProducts) {
    list.add(ProductModel.fromJson(element));
  }
  return list;
}

Future<List<ProductModel>> fetchData(String url) async {
  final List<ProductModel> list = [];
  final data = await apiProvider.get(url);
  var dataProducts = data as List;
  for (var element in dataProducts) {
    list.add(ProductModel.fromJson(element));
  }
  return list;
}

Future<String> putData(String url, dynamic data) async {
  final response = await apiProvider.put(url, data);
  return response.toString();
}
