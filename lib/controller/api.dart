import 'dart:convert';

import 'package:dio/dio.dart';

class ApiProvider {
  Dio _dio = Dio();

  ApiProvider() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://demo41.ninavietnam.com.vn/api/',
    );

    _dio = Dio(options);
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);
      return jsonDecode(response.toString());
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> put(String url, dynamic data) async {
    try {
      final response = await _dio.put(url, data: data);
      return jsonDecode(response.toString());
    } catch (e) {
      return e;
    }
  }
}
