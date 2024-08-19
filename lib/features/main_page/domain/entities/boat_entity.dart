import 'package:json_annotation/json_annotation.dart';

part 'boat_entity.g.dart';

@JsonSerializable()
class BoatEntity {
  final int id;
  final String image;
  final String title;
  final String price;
  final String currency;

  BoatEntity(
      {required this.id,
        required this.image,
        required this.title,
        required this.price,
        required this.currency});

  factory BoatEntity.fromJson(Map<String, dynamic> json) =>
      _$BoatEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BoatEntityToJson(this);
}
