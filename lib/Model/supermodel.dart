import 'package:flutter_app/Model/addproductmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supermodel.g.dart';

@JsonSerializable()
class SuperModel {
  List<Addproductmodel> data;
  SuperModel({this.data});
  factory SuperModel.fromJson(Map<String, dynamic> json) =>
      _$SuperModelFromJson(json);
  Map<String, dynamic> toJson() => _$SuperModelToJson(this);
}