// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listOfProfiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

listOfProfiles _$listOfProfilesFromJson(Map<String, dynamic> json) {
  return listOfProfiles(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ProfileModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$listOfProfilesToJson(listOfProfiles instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
