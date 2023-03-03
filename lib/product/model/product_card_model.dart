import 'package:hive_flutter/hive_flutter.dart';

part 'product_card_model.g.dart';

@HiveType(typeId: 1)
class ProductCardModel {
  @HiveField(1)
  late int id;
  @HiveField(2)
  late String photo;
  @HiveField(3)
  late String nameen;
  @HiveField(4)
  late String namevi;
  @HiveField(5)
  late int regularPrice;
  @HiveField(6)
  late String status;

  ProductCardModel({
    this.id = 0,
    this.photo = "",
    this.nameen = "",
    this.namevi = "",
    this.regularPrice = 0,
    this.status = "",
  });

  ProductCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    nameen = json['nameen'];
    namevi = json['namevi'];
    regularPrice = json['regular_price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photo'] = photo;
    data['nameen'] = nameen;
    data['namevi'] = namevi;
    data['regular_price'] = regularPrice;
    data['status'] = status;
    return data;
  }
}
