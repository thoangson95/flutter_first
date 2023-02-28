class ProductModel {
  String? id;
  String? name;
  String? photo;
  String? regularPrice;
  String? salePrice;
  String? discount;
  String? status;
  String? idList;

  ProductModel(
      {this.id,
      this.name,
      this.photo,
      this.regularPrice,
      this.salePrice,
      this.discount,
      this.status,
      this.idList});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
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
    data['name'] = name;
    data['photo'] = photo;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    data['discount'] = discount;
    data['status'] = status;
    data['id_list'] = idList;
    return data;
  }
}
