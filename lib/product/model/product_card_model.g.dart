// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCardModelAdapter extends TypeAdapter<ProductCardModel> {
  @override
  final int typeId = 1;

  @override
  ProductCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCardModel(
      id: fields[1] as int,
      photo: fields[2] as String,
      nameen: fields[3] as String,
      namevi: fields[4] as String,
      regularPrice: fields[5] as int,
      status: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductCardModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.nameen)
      ..writeByte(4)
      ..write(obj.namevi)
      ..writeByte(5)
      ..write(obj.regularPrice)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
