import 'package:flutter_app/Model/addproductmodel.dart';
import 'package:flutter_app/Model/profileModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listOfProfiles.g.dart';

@JsonSerializable()
class listOfProfiles {
  List<ProfileModel> data;
  listOfProfiles({this.data});
  factory listOfProfiles.fromJson(Map<String, dynamic> json) =>
      _$listOfProfilesFromJson(json);
  Map<String, dynamic> toJson() => _$listOfProfilesToJson(this);
}