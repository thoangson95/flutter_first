import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

class Product {
  final String name;
  final String image;
  final int price;
  final int isFavorite;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.isFavorite,
  });
}

final List<Product> categories = [
  Product(
    name: 'Áo thun nữ thời trang',
    image: 'assets/images/sp1.png',
    price: 125000,
    isFavorite: 1,
  ),
  Product(
    name: 'Áo thun nữ thời trang',
    image: 'assets/images/sp2.png',
    price: 125000,
    isFavorite: 0,
  ),
  Product(
    name: 'Áo thun nữ thời trang',
    image: 'assets/images/sp3.png',
    price: 125000,
    isFavorite: 0,
  ),
  Product(
    name: 'Áo thun nữ thời trang',
    image: 'assets/images/sp4.png',
    price: 125000,
    isFavorite: 1,
  ),
];

const List<String> imageList = [
  "https://images.template.net/108414/fashion-sale-banner-template-85svg.jpg",
  "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-sale-banner-template-design-389dc7a74f096738d1d425314404a2cd_screen.jpg?ts=1605613724",
  "https://img.freepik.com/premium-vector/fashion-week-banner-template-promotion-fashion-banner_122059-223.jpg",
];

class TabHome extends StatelessWidget {
  const TabHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Column(
            children: [
              GFCarousel(
                autoPlay: true,
                height: 150.0,
                viewportFraction: 1.0,
                items: imageList.map(
                  (url) {
                    return Image.network(url, fit: BoxFit.cover, width: 1200.0);
                  },
                ).toList(),
                onPageChanged: (index) {},
              ),
            ],
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: const Text('Danh sách sản pjaa'),
      )
    ]);
  }
}
