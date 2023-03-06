import 'package:equatable/equatable.dart';

class HomeProductModel extends Equatable {
  const HomeProductModel({
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

  final String? id;
  final String? code;
  final String? namevi;
  final String? descvi;
  final String? photo;
  final String? regularPrice;
  final String? salePrice;
  final String? discount;
  final String? status;
  final String? idList;

  HomeProductModel copyWith({
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
  }) {
    return HomeProductModel(
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
        idList
      ];
}
