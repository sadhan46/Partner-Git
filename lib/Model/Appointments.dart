import 'package:flutter_app/Model/Appointmentmodel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Appointments.g.dart';

@JsonSerializable()
class Appointments {
  List<Appointment> data;
  Appointments({this.data});
  factory Appointments.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentsToJson(this);
}