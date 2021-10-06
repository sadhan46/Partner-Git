import 'package:flutter_app/Model/addbusinessmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listOfBusiness.g.dart';

@JsonSerializable()
class listOfBusiness {
  List<Addbusinessmodel> data;
  listOfBusiness({this.data});
  factory listOfBusiness.fromJson(Map<String, dynamic> json) =>
      _$listOfBusinessFromJson(json);
  Map<String, dynamic> toJson() => _$listOfBusinessToJson(this);
}