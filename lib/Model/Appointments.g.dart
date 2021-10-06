// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Appointments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointments _$AppointmentsFromJson(Map<String, dynamic> json) {
  return Appointments(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Appointment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppointmentsToJson(Appointments instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
