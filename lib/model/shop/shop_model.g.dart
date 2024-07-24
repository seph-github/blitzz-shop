// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopModelImpl _$$ShopModelImplFromJson(Map<String, dynamic> json) =>
    _$ShopModelImpl(
      id: json['id'] as String,
      shopName: json['shopName'] as String,
      shopProfile: json['shopProfile'] as String,
      ownersName: json['ownersName'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      stateOrProvince: json['stateOrProvince'] as String,
      street1: json['street1'] as String,
      zipcode: json['zipcode'] as String,
      street2: json['street2'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$$ShopModelImplToJson(_$ShopModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopName': instance.shopName,
      'shopProfile': instance.shopProfile,
      'ownersName': instance.ownersName,
      'country': instance.country,
      'city': instance.city,
      'stateOrProvince': instance.stateOrProvince,
      'street1': instance.street1,
      'zipcode': instance.zipcode,
      'street2': instance.street2,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'createdDate': instance.createdDate.toIso8601String(),
      'isActive': instance.isActive,
    };
