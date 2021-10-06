import 'package:flutter_app/Model/addservicemodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AppointmentTest.g.dart';

@JsonSerializable()
class AppointmentTest {
  String username;
  String slot_1_starting_time ;
  String slot_1_ending_time ;
  String slot_2_starting_time ;
  String slot_2_ending_time ;
  String slot_3_starting_time ;
  String slot_3_ending_time ;
  String slot_4_starting_time ;
  String slot_4_ending_time ;
  String slot_5_starting_time ;
  String slot_5_ending_time ;
  String slot_6_starting_time ;
  String slot_6_ending_time ;

  AppointmentTest(
      {
        this.username,
        this.slot_1_starting_time ,
        this.slot_1_ending_time ,
        this.slot_2_starting_time ,
        this.slot_2_ending_time ,
        this.slot_3_starting_time ,
        this.slot_3_ending_time ,
        this.slot_4_starting_time ,
        this.slot_4_ending_time ,
        this.slot_5_starting_time ,
        this.slot_5_ending_time ,
        this.slot_6_starting_time ,
        this.slot_6_ending_time ,
      });

  factory AppointmentTest.fromJson(Map<String, dynamic> json) =>
      _$AppointmentTestFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentTestToJson(this);
}