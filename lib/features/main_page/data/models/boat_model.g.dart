// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoatModel _$BoatModelFromJson(Map<String, dynamic> json) => BoatModel(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      title: json['title'] as String,
      price: json['amount'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$BoatModelToJson(BoatModel instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'amount': instance.price,
      'currency': instance.currency,
    };
