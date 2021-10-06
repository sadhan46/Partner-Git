// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    username: json['username'] as String,
    address: json['address'] as String,
    date: json['date'] as String,
    service_time: json['service_time'] as String,
    services: json['services'] as String,
    total: json['total'] as String,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'address': instance.address,
      'services': instance.services,
      'service_time': instance.service_time,
      'date': instance.date,
      'total': instance.total,
    };
