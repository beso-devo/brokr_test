// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoatEntity _$BoatEntityFromJson(Map<String, dynamic> json) => BoatEntity(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$BoatEntityToJson(BoatEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'price': instance.price,
      'currency': instance.currency,
    };
