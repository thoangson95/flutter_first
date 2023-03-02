import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  ProductModel(
      {this.id,
      this.name,
      this.photo,
      this.regularPrice,
      this.salePrice,
      this.discount,
      this.status,
      this.idList,
      this.gallery});

  // All properties should be `final` on our class.
  String? id;
  String? name;
  String? photo;
  String? regularPrice;
  String? salePrice;
  String? discount;
  String? status;
  String? idList;
  List<dynamic>? gallery;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    discount = json['discount'];
    status = json['status'];
    idList = json['id_list'];
    gallery = json['gallery'] as List<String>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['photo'] = photo;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    data['discount'] = discount;
    data['status'] = status;
    data['id_list'] = idList;
    data['gallery'] = gallery;
    return data;
  }

  ProductModel copyWith(
      {String? id,
      String? name,
      String? photo,
      String? regularPrice,
      String? salePrice,
      String? discount,
      String? status,
      String? idList,
      List<String>? gallery}) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      discount: discount ?? this.discount,
      status: status ?? this.status,
      idList: idList ?? this.idList,
      gallery: gallery ?? this.gallery,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        photo,
        regularPrice,
        salePrice,
        discount,
        status,
        idList,
        gallery,
      ];
}
