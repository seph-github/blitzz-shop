// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneCodeImpl _$$PhoneCodeImplFromJson(Map<String, dynamic> json) =>
    _$PhoneCodeImpl(
      name: json['name'] as String,
      dialCode: json['dialCode'] as String,
      emoji: json['emoji'] as String?,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$PhoneCodeImplToJson(_$PhoneCodeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dialCode': instance.dialCode,
      'emoji': instance.emoji,
      'code': instance.code,
    };
