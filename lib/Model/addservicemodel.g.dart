// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addservicemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddServiceModel _$AddServiceModelFromJson(Map<String, dynamic> json) {
  return AddServiceModel(
    id: json['_id'] as String,
    username: json['username'] as String,
    serviceName: json['serviceName'] as String,
    currency: json['currency'] as String,
    serviceCost: json['serviceCost'] as String,
    hr: json['hr'] as String,
    min: json['min'] as String,
    counter: json['counter'] as int,
    addProduct: json['addProduct'] as bool,
  );
}

Map<String, dynamic> _$AddServiceModelToJson(AddServiceModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'serviceName': instance.serviceName,
      'currency': instance.currency,
      'serviceCost': instance.serviceCost,
      'hr': instance.hr,
      'min': instance.min,
      'counter': instance.counter,
      'addProduct': instance.addProduct,
    };
