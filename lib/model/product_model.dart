class ProductModel {
  int? id;
  int? idList;
  int? idItem;
  int? idCat;
  int? idSub;
  int? idBrand;
  String? photo;
  String? options;
  String? slugvi;
  String? slugen;
  String? contenten;
  String? contentvi;
  String? descen;
  String? descvi;
  String? nameen;
  String? namevi;
  String? code;
  int? regularPrice;
  int? discount;
  int? salePrice;
  int? numb;
  String? status;
  String? type;
  int? dateCreated;
  int? dateUpdated;
  int? view;

  ProductModel(
      {this.id,
      this.idList,
      this.idItem,
      this.idCat,
      this.idSub,
      this.idBrand,
      this.photo,
      this.options,
      this.slugvi,
      this.slugen,
      this.contenten,
      this.contentvi,
      this.descen,
      this.descvi,
      this.nameen,
      this.namevi,
      this.code,
      this.regularPrice,
      this.discount,
      this.salePrice,
      this.numb,
      this.status,
      this.type,
      this.dateCreated,
      this.dateUpdated,
      this.view});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idList = json['id_list'];
    idItem = json['id_item'];
    idCat = json['id_cat'];
    idSub = json['id_sub'];
    idBrand = json['id_brand'];
    photo = json['photo'];
    options = json['options'];
    slugvi = json['slugvi'];
    slugen = json['slugen'];
    contenten = json['contenten'];
    contentvi = json['contentvi'];
    descen = json['descen'];
    descvi = json['descvi'];
    nameen = json['nameen'];
    namevi = json['namevi'];
    code = json['code'];
    regularPrice = json['regular_price'];
    discount = json['discount'];
    salePrice = json['sale_price'];
    numb = json['numb'];
    status = json['status'];
    type = json['type'];
    dateCreated = json['date_created'];
    dateUpdated = json['date_updated'];
    view = json['view'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_list'] = idList;
    data['id_item'] = idItem;
    data['id_cat'] = idCat;
    data['id_sub'] = idSub;
    data['id_brand'] = idBrand;
    data['photo'] = photo;
    data['options'] = options;
    data['slugvi'] = slugvi;
    data['slugen'] = slugen;
    data['contenten'] = contenten;
    data['contentvi'] = contentvi;
    data['descen'] = descen;
    data['descvi'] = descvi;
    data['nameen'] = nameen;
    data['namevi'] = namevi;
    data['code'] = code;
    data['regular_price'] = regularPrice;
    data['discount'] = discount;
    data['sale_price'] = salePrice;
    data['numb'] = numb;
    data['status'] = status;
    data['type'] = type;
    data['date_created'] = dateCreated;
    data['date_updated'] = dateUpdated;
    data['view'] = view;
    return data;
  }
}
