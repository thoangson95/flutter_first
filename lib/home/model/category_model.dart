class CategoryModel {
  late int id;
  late String nameen;
  late String namevi;
  late String photo;

  CategoryModel({
    this.id = 0,
    this.nameen = "",
    this.namevi = "",
    this.photo = "",
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameen = json['nameen'];
    namevi = json['namevi'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameen'] = nameen;
    data['namevi'] = namevi;
    data['photo'] = photo;
    return data;
  }
}
