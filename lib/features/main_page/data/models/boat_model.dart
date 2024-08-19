import 'package:json_annotation/json_annotation.dart';

part 'boat_model.g.dart';

@JsonSerializable()
class BoatModel {
  final int id;
  final String image;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'amount')
  final String price;
  @JsonKey(name: 'currency')
  final String currency;

  BoatModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.currency});

  factory BoatModel.fromJson(Map<String, dynamic> json) =>
      _$BoatModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoatModelToJson(this);
}
