import 'package:json_annotation/json_annotation.dart';

part 'car_model.g.dart';

@JsonSerializable()
class CarModel {
  final int id;
  final String name;
  final String brand;

  CarModel({required this.id, required this.name, required this.brand});

  factory CarModel.fromJson(Map<String, dynamic> json) => _$CarModelFromJson(json);
  Map<String, dynamic> toJson() => _$CarModelToJson(this);
}