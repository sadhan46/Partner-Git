import 'package:flutter_app/Model/addservicemodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Appointmentmodel.g.dart';

@JsonSerializable()
class Appointment {
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
  String customer_contact_number;
  String start_time;
  String end_time;
  String total_time;
  String Total;
  List<String> close_days;
  List<AddServiceModel> cart;



  Appointment(
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
        this.customer_name,
        this.customer_contact_number,
        this.end_time,
        this.start_time,
        this.total_time,
        this.Total,
        this.close_days,
        this.cart,
      });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}