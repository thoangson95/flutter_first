class HomeProductModel {
  late int id;
  late String photo;
  late String nameen;
  late String namevi;
  late int regularPrice;
  late String status;

  HomeProductModel({
    this.id = 0,
    this.photo = "",
    this.nameen = "",
    this.namevi = "",
    this.regularPrice = 0,
    this.status = "",
  });

  HomeProductModel.fromJson(Map<String, dynamic> json) {
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
