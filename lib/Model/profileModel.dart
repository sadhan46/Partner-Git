import 'package:json_annotation/json_annotation.dart';

part 'profileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  String username;
  String address;
  String services;
  String service_time;
  String date;
  String total;
  ProfileModel(
      {
        this.username,
        this.address,
        this.date,
        this.service_time,
        this.services,
        this.total,
      });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}