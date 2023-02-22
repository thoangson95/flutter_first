import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

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

class FavoriteButton extends StatefulWidget {
  final double size;

  const FavoriteButton({required this.size});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleFavorite,
      child: Container(
        padding: const EdgeInsets.all(0),
        width: widget.size,
        height: widget.size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            isFavorite
                ? Icon(Icons.favorite, color: Colors.red, size: widget.size)
                : Icon(Icons.favorite_border,
                    color: Colors.red, size: widget.size),
          ],
        ),
      ),
    );
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: LayoutGrid(
        columnGap: 20,
        rowGap: 20,
        columnSizes: const [FlexibleTrackSize(1), FlexibleTrackSize(1)],
        rowSizes: const [
          auto,
          auto,
        ],
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/images/sp1.png',
                  width: double.infinity,
                  height: 205,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        "Tên sản phẩmTên sản phẩmTên sản Tên sản phẩmTên sản phẩmTên sản ",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(55, 55, 55, 1),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      child: const FavoriteButton(size: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                child: const Text(
                  '290.000đ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFF7465),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/images/sp1.png',
                  width: double.infinity,
                  height: 205,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        "Tên sản phẩmTên sản phẩmTên sản Tên sản phẩmTên sản phẩmTên sản ",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(55, 55, 55, 1),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      child: const FavoriteButton(size: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                child: const Text(
                  '290.000đ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFF7465),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/images/sp1.png',
                  width: double.infinity,
                  height: 205,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        "Tên sản phẩmTên sản phẩmTên sản Tên sản phẩmTên sản phẩmTên sản ",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(55, 55, 55, 1),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      child: const FavoriteButton(size: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                child: const Text(
                  '290.000đ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFF7465),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/images/sp1.png',
                  width: double.infinity,
                  height: 205,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        "Tên sản phẩmTên sản phẩmTên sản Tên sản phẩmTên sản phẩmTên sản ",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(55, 55, 55, 1),
                        ),
                      ),
                    ),
                    SizedBox.fromSize(
                      child: const FavoriteButton(size: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: double.infinity,
                child: const Text(
                  '290.000đ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFFF7465),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Row(
          children: <Widget>[
            const Flexible(
              fit: FlexFit.tight,
              child: Text(
                'Hàng mới về',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromRGBO(34, 34, 34, 1),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: InkWell(
                onTap: () => context.go('/product-detail'),
                child: const Text(
                  'Tất cả',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(255, 116, 101, 1),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        child: const GridProduct(),
      ),
    ]);
  }
}
