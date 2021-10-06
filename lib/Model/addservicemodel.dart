import 'package:json_annotation/json_annotation.dart';

part 'addservicemodel.g.dart';

@JsonSerializable()
class AddServiceModel {
  @JsonKey(name: "_id")
  String id;
  String username;
  String serviceName;
  String currency;
  String serviceCost;
  String hr;
  String min;
  int counter;
  bool addProduct;

  AddServiceModel(
      {
        this.id,
        this.username,
        this.serviceName,
        this.currency,
        this.serviceCost,
        this.hr,
        this.min,
        this.counter,
        this.addProduct,
      });

  factory AddServiceModel.fromJson(Map<String, dynamic> json) =>
      _$AddServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddServiceModelToJson(this);
}