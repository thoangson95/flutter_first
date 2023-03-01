class Product {
  String? id;
  String? code;
  String? namevi;
  String? descvi;
  String? photo;
  String? regularPrice;
  String? salePrice;
  String? discount;
  String? status;
  String? idList;

  Product({
    this.id,
    this.code,
    this.namevi,
    this.descvi,
    this.photo,
    this.regularPrice,
    this.salePrice,
    this.discount,
    this.status,
    this.idList,
  });

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
    final Map<String, dynamic> data = <String, dynamic>{};
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
