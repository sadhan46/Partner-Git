// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    id: json['_id'] as String,
    username: json['username'] as String,
    date: json['date'] as String,
    end_time: json['end_time'] as String,
    start_time: json['start_time'] as String,
    Total: json['Total'] as String,
    total_time: json['total_time'] as String,
    cart: (json['cart'] as List)?.map((e) => e as String)?.toList(),
    customer_name: json['customer_name'] as String,
    customer_contact_number: json['customer_contact_number'] as String,
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'date': instance.date,
      'customer_name': instance.customer_name,
      'customer_contact_number': instance.customer_contact_number,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'Total': instance.Total,
      'total_time': instance.total_time,
      'cart': instance.cart,
    };
