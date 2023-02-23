class User {
  late int id;
  late String email;
  late String password;
  late String name;
  late String role;
  late String avatar;
  late String creationAt;
  late String updatedAt;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.name,
      required this.role,
      required this.avatar,
      required this.creationAt,
      required this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['role'] = role;
    data['avatar'] = avatar;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
