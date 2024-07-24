import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.g.dart';
part 'shop_model.freezed.dart';

@freezed
class ShopModel with _$ShopModel {
  const factory ShopModel({
    required String id,
    required String shopName,
    required String shopProfile,
    required String ownersName,
    required String country,
    required String city,
    required String stateOrProvince,
    required String street1,
    required String zipcode,
    String? street2,
    required String phoneNumber,
    required String email,
    required DateTime createdDate,
    @Default(true) bool isActive,
    // List<ProductModel>? products,
    // List<UserModel>? users,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
}
