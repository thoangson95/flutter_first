class ProductModel {
  int? id;
  int? idList;
  int? idItem;
  int? idCat;
  int? idSub;
  int? idBrand;
  String? photo;
  String? photo2;
  String? options;
  String? options2;
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
      this.photo2,
      this.options,
      this.options2,
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
    photo2 = json['photo2'];
    options = json['options'];
    options2 = json['options2'];
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
    data['photo2'] = photo2;
    data['options'] = options;
    data['options2'] = options2;
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

class UserModel {
  int? id;
  int? idSocial;
  String? username;
  String? password;
  String? confirmCode;
  String? avatar;
  String? fullname;
  int? phone;
  String? email;
  String? address;
  int? gender;
  String? loginSession;
  String? lastlogin;
  String? status;
  int? birthday;
  int? numb;

  UserModel(Future<UserModel> Function(dynamic ref) param0, 
      {this.id,
      this.idSocial,
      this.username,
      this.password,
      this.confirmCode,
      this.avatar,
      this.fullname,
      this.phone,
      this.email,
      this.address,
      this.gender,
      this.loginSession,
      this.lastlogin,
      this.status,
      this.birthday,
      this.numb});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSocial = json['id_social'];
    username = json['username'];
    password = json['password'];
    confirmCode = json['confirm_code'];
    avatar = json['avatar'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    gender = json['gender'];
    loginSession = json['login_session'];
    lastlogin = json['lastlogin'];
    status = json['status'];
    birthday = json['birthday'];
    numb = json['numb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_social'] = idSocial;
    data['username'] = username;
    data['password'] = password;
    data['confirm_code'] = confirmCode;
    data['avatar'] = avatar;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['gender'] = gender;
    data['login_session'] = loginSession;
    data['lastlogin'] = lastlogin;
    data['status'] = status;
    data['birthday'] = birthday;
    data['numb'] = numb;
    return data;
  }

}