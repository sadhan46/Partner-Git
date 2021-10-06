// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Services _$ServicesFromJson(Map<String, dynamic> json) {
  return Services(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : AddServiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ServicesToJson(Services instance) => <String, dynamic>{
      'data': instance.data,
    };
