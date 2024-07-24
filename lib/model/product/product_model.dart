import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String shopId,
    required String name,
    required String imageUrl,
    required String description,
    required String category,
    required double price,
    @Default(true) bool isAvailable,
    @Default(0) int quantity,
    required DateTime createdDate,
    required String createdBy,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
