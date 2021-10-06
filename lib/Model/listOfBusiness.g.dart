// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listOfBusiness.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

listOfBusiness _$listOfBusinessFromJson(Map<String, dynamic> json) {
  return listOfBusiness(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : Addbusinessmodel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$listOfBusinessToJson(listOfBusiness instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
