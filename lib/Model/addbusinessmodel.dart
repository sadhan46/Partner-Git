import 'package:json_annotation/json_annotation.dart';

part 'addbusinessmodel.g.dart';

@JsonSerializable()
class Addbusinessmodel {
  String username;
  String business_name;
  Addbusinessmodel(
      {
        this.username,
        this.business_name,
      });

  factory Addbusinessmodel.fromJson(Map<String, dynamic> json) =>
      _$AddbusinessmodelFromJson(json);
  Map<String, dynamic> toJson() => _$AddbusinessmodelToJson(this);
}