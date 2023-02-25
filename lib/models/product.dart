class Product {
  Product({
    required this.id,
    required this.code,
    required this.namevi,
    required this.descvi,
    required this.photo,
    required this.regularPrice,
    required this.salePrice,
    required this.discount,
    required this.status,
    required this.idList,
  });

  late final String id;
  late final String code;
  late final String namevi;
  late final String descvi;
  late final String photo;
  late final String regularPrice;
  late final String salePrice;
  late final String discount;
  late final String status;
  late final String idList;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    namevi = json['namevi'];
    descvi = json['descvi'];
    photo = json['photo'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    discount = json['discount'];
    status = json['status'];
    idList = json['id_list'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['namevi'] = namevi;
    data['descvi'] = descvi;
    data['photo'] = photo;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    data['discount'] = discount;
    data['status'] = status;
    data['id_list'] = idList;
    return data;
  }
}

// class Product {
//   final String name;
//   final String image;
//   final int price;
//   final String path;
//   bool isFavorite;

//   Product({
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.path,
//     this.isFavorite = false,
//   });
// }

// final List<Product> listProduct = [
//   Product(
//     name: 'Áo thun nữ thời trang 01',
//     image: 'assets/images/sp1.png',
//     price: 125000,
//     path: '/product-detail',
//     isFavorite: true,
//   ),
//   Product(
//     name: 'Áo thun nữ thời trang 02',
//     image: 'assets/images/sp2.png',
//     price: 125000,
//     path: '/product-detail',
//     isFavorite: false,
//   ),
//   Product(
//     name: 'Áo thun nữ thời trang 03',
//     image: 'assets/images/sp3.png',
//     price: 125000,
//     path: '/product-detail',
//     isFavorite: false,
//   ),
//   Product(
//     name: 'Áo thun nữ thời trang 04',
//     image: 'assets/images/sp4.png',
//     price: 125000,
//     path: '/product-detail',
//     isFavorite: false,
//   ),
//   Product(
//     name: 'Áo thun nữ thời trang 05',
//     image: 'assets/images/sp5.png',
//     price: 125000,
//     path: '/product-detail',
//     isFavorite: false,
//   ),
//   Product(
//     name: 'Áo thun nữ thời trang 06',
//     image: 'assets/images/sp6.png',
//     price: 125000,
//     path: '/product-detail',
//     isFavorite: true,
//   ),
// ];

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
