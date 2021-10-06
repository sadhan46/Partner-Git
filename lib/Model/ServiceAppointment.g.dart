// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServiceAppointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceAppointment _$ServiceAppointmentFromJson(Map<String, dynamic> json) {
  return ServiceAppointment(
    username: json['username'] as String,
    slot_1_starting_time: json['slot_1_starting_time'] as String,
    slot_1_ending_time: json['slot_1_ending_time'] as String,
    slot_2_starting_time: json['slot_2_starting_time'] as String,
    slot_2_ending_time: json['slot_2_ending_time'] as String,
    slot_3_starting_time: json['slot_3_starting_time'] as String,
    slot_3_ending_time: json['slot_3_ending_time'] as String,
    slot_4_starting_time: json['slot_4_starting_time'] as String,
    slot_4_ending_time: json['slot_4_ending_time'] as String,
    slot_5_starting_time: json['slot_5_starting_time'] as String,
    slot_5_ending_time: json['slot_5_ending_time'] as String,
    slot_6_starting_time: json['slot_6_starting_time'] as String,
    slot_6_ending_time: json['slot_6_ending_time'] as String,
    date: json['date'] as String,
    end_time: json['end_time'] as String,
    start_time: json['start_time'] as String,
    totalTime: json['totalTime'] as String,
    total: json['total'] as String,
    close_days: (json['close_days'] as List)?.map((e) => e as String)?.toList(),
    cart_products: (json['cart_products'] as List)
        ?.map((e) => e == null
            ? null
            : AddServiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    customer_name: json['customer_name'] as String,
    customer_address: json['customer_address'] as String,
    customer_contact_number: json['customer_contact_number'] as String,
    pin_Code: json['pin_Code'] as String,
  );
}

Map<String, dynamic> _$ServiceAppointmentToJson(ServiceAppointment instance) =>
    <String, dynamic>{
      'username': instance.username,
      'slot_1_starting_time': instance.slot_1_starting_time,
      'slot_1_ending_time': instance.slot_1_ending_time,
      'slot_2_starting_time': instance.slot_2_starting_time,
      'slot_2_ending_time': instance.slot_2_ending_time,
      'slot_3_starting_time': instance.slot_3_starting_time,
      'slot_3_ending_time': instance.slot_3_ending_time,
      'slot_4_starting_time': instance.slot_4_starting_time,
      'slot_4_ending_time': instance.slot_4_ending_time,
      'slot_5_starting_time': instance.slot_5_starting_time,
      'slot_5_ending_time': instance.slot_5_ending_time,
      'slot_6_starting_time': instance.slot_6_starting_time,
      'slot_6_ending_time': instance.slot_6_ending_time,
      'date': instance.date,
      'customer_name': instance.customer_name,
      'customer_address': instance.customer_address,
      'customer_contact_number': instance.customer_contact_number,
      'pin_Code': instance.pin_Code,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'totalTime': instance.totalTime,
      'total': instance.total,
      'close_days': instance.close_days,
      'cart_products': instance.cart_products,
    };
