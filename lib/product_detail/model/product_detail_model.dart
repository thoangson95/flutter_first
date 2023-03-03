import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductDetailModel extends Equatable {
  ProductDetailModel({
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
    this.gallery,
    this.color,
  });

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
  List<dynamic>? gallery;
  List<dynamic>? color;

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
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
    gallery = json['gallery'] as List<dynamic>;
    color = json['color'] as List<dynamic>;
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
    data['gallery'] = gallery;
    data['color'] = color;
    return data;
  }

  ProductDetailModel copyWith({
    String? id,
    String? code,
    String? namevi,
    String? descvi,
    String? photo,
    String? regularPrice,
    String? salePrice,
    String? discount,
    String? status,
    String? idList,
    List<String>? gallery,
    List<String>? color,
  }) {
    return ProductDetailModel(
      id: id ?? this.id,
      code: code ?? this.code,
      namevi: namevi ?? this.namevi,
      descvi: descvi ?? this.descvi,
      photo: photo ?? this.photo,
      regularPrice: regularPrice ?? this.regularPrice,
      salePrice: salePrice ?? this.salePrice,
      discount: discount ?? this.discount,
      status: status ?? this.status,
      idList: idList ?? this.idList,
      gallery: gallery ?? this.gallery,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [
        id,
        code,
        namevi,
        descvi,
        photo,
        regularPrice,
        salePrice,
        discount,
        status,
        idList,
        gallery,
        color
      ];
}
