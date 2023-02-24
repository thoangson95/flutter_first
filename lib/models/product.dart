import 'dart:convert';

import 'package:dio/dio.dart';

class Product {
  final String name;
  final String image;
  final int price;
  final String path;
  bool isFavorite;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.path,
    this.isFavorite = false,
  });
}

void getHttp() async {
  try {
    Response response = await Dio().get("http://www.google.com");
    print(response);
  } catch (e) {
    print(e);
  }
}

final List<Product> listProduct = [
  Product(
    name: 'Áo thun nữ thời trang 01',
    image: 'assets/images/sp1.png',
    price: 125000,
    path: '/product-detail',
    isFavorite: true,
  ),
  Product(
    name: 'Áo thun nữ thời trang 02',
    image: 'assets/images/sp2.png',
    price: 125000,
    path: '/product-detail',
    isFavorite: false,
  ),
  Product(
    name: 'Áo thun nữ thời trang 03',
    image: 'assets/images/sp3.png',
    price: 125000,
    path: '/product-detail',
    isFavorite: false,
  ),
  Product(
    name: 'Áo thun nữ thời trang 04',
    image: 'assets/images/sp4.png',
    price: 125000,
    path: '/product-detail',
    isFavorite: false,
  ),
  Product(
    name: 'Áo thun nữ thời trang 05',
    image: 'assets/images/sp5.png',
    price: 125000,
    path: '/product-detail',
    isFavorite: false,
  ),
  Product(
    name: 'Áo thun nữ thời trang 06',
    image: 'assets/images/sp6.png',
    price: 125000,
    path: '/product-detail',
    isFavorite: true,
  ),
];

class Categories {
  final String name;
  final String image;

  Categories({required this.name, required this.image});
}

final List<Categories> categories = [
  Categories(name: 'Hàng mới về', image: 'assets/images/banner.png'),
  Categories(name: 'Hàng bán chạy', image: 'assets/images/banner1.png'),
  Categories(name: 'Hàng khuyến mãi', image: 'assets/images/banner2.png'),
  Categories(name: 'Áo khoác', image: 'assets/images/banner3.png'),
  Categories(name: 'Đầm', image: 'assets/images/banner1.png'),
  Categories(name: 'Jumpsuit', image: 'assets/images/banner2.png'),
];
