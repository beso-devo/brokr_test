import 'package:json_annotation/json_annotation.dart';

part 'beneficiary_model.g.dart';

@JsonSerializable()
class BeneficiaryModelS {
  final int id;
  @JsonKey(name: 'nick_name')
  final String nickName;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  BeneficiaryModelS(this.id, this.nickName, this.phoneNumber);

  factory BeneficiaryModelS.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryModelSFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryModelSToJson(this);

  /// We can do the serialization like this way...
// final Map<String, dynamic> data = jsonDecode(response.body);
// final user = BeneficiaryModelS.fromJson(data);

  /// We can do the deserialization like this way...
// final BeneficiaryModelS beneficiaryModelS = {...};
// json = beneficiaryModelS.toJson();
}
