import 'package:flutter_app/Model/addservicemodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Services.g.dart';

@JsonSerializable()
class Services {
  List<AddServiceModel> data;
  Services({this.data});
  factory Services.fromJson(Map<String, dynamic> json) =>
      _$ServicesFromJson(json);
  Map<String, dynamic> toJson() => _$ServicesToJson(this);
}