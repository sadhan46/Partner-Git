import 'package:flutter_app/Model/addservicemodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ServiceAppointment.g.dart';

@JsonSerializable()
class ServiceAppointment {
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
  String date;
  String customer_name;
  String customer_address;
  String customer_contact_number;
  String pin_Code;
  String start_time;
  String end_time;
  String totalTime;
  String total;
  List<String> close_days;
  List<AddServiceModel> cart_products;



  ServiceAppointment(
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
        this.date,
        this.end_time,
        this.start_time,
        this.totalTime,
        this.total,
        this.close_days,
        this.cart_products,
        this.customer_name,
        this.customer_address,
        this.customer_contact_number,
        this.pin_Code
      });

  factory ServiceAppointment.fromJson(Map<String, dynamic> json) =>
      _$ServiceAppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceAppointmentToJson(this);
}