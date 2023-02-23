import 'category_model.dart';

class Product {
  late int id;
  late String title;
  late int price;
  late String description;
  late List<String> images;
  late String creationAt;
  late String updatedAt;
  late Category category;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images,
      required this.creationAt,
      required this.updatedAt,
      required this.category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = (json['category'] != null
        ? Category.fromJson(json['category'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['images'] = images;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    data['category'] = category.toJson();
    return data;
  }
}
