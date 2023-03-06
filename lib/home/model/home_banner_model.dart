import 'package:equatable/equatable.dart';

class HomeBannerModel extends Equatable {
  const HomeBannerModel({
    this.id,
    this.namevi,
    this.photo,
  });

  final String? id;
  final String? namevi;
  final String? photo;

  HomeBannerModel copyWith({
    String? id,
    String? namevi,
    String? photo,
  }) {
    return HomeBannerModel(
      id: id ?? this.id,
      namevi: namevi ?? this.namevi,
      photo: photo ?? this.photo,
    );
  }

  @override
  List<Object?> get props => [
        id,
        namevi,
        photo,
      ];
}
