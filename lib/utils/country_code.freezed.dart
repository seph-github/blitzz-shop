// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhoneCode _$PhoneCodeFromJson(Map<String, dynamic> json) {
  return _PhoneCode.fromJson(json);
}

/// @nodoc
mixin _$PhoneCode {
  String get name => throw _privateConstructorUsedError;
  String get dialCode => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneCodeCopyWith<PhoneCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneCodeCopyWith<$Res> {
  factory $PhoneCodeCopyWith(PhoneCode value, $Res Function(PhoneCode) then) =
      _$PhoneCodeCopyWithImpl<$Res, PhoneCode>;
  @useResult
  $Res call({String name, String dialCode, String? emoji, String code});
}

/// @nodoc
class _$PhoneCodeCopyWithImpl<$Res, $Val extends PhoneCode>
    implements $PhoneCodeCopyWith<$Res> {
  _$PhoneCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dialCode = null,
    Object? emoji = freezed,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: null == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneCodeImplCopyWith<$Res>
    implements $PhoneCodeCopyWith<$Res> {
  factory _$$PhoneCodeImplCopyWith(
          _$PhoneCodeImpl value, $Res Function(_$PhoneCodeImpl) then) =
      __$$PhoneCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String dialCode, String? emoji, String code});
}

/// @nodoc
class __$$PhoneCodeImplCopyWithImpl<$Res>
    extends _$PhoneCodeCopyWithImpl<$Res, _$PhoneCodeImpl>
    implements _$$PhoneCodeImplCopyWith<$Res> {
  __$$PhoneCodeImplCopyWithImpl(
      _$PhoneCodeImpl _value, $Res Function(_$PhoneCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? dialCode = null,
    Object? emoji = freezed,
    Object? code = null,
  }) {
    return _then(_$PhoneCodeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: null == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneCodeImpl implements _PhoneCode {
  const _$PhoneCodeImpl(
      {required this.name,
      required this.dialCode,
      this.emoji,
      required this.code});

  factory _$PhoneCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneCodeImplFromJson(json);

  @override
  final String name;
  @override
  final String dialCode;
  @override
  final String? emoji;
  @override
  final String code;

  @override
  String toString() {
    return 'PhoneCode(name: $name, dialCode: $dialCode, emoji: $emoji, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneCodeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, dialCode, emoji, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneCodeImplCopyWith<_$PhoneCodeImpl> get copyWith =>
      __$$PhoneCodeImplCopyWithImpl<_$PhoneCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneCodeImplToJson(
      this,
    );
  }
}

abstract class _PhoneCode implements PhoneCode {
  const factory _PhoneCode(
      {required final String name,
      required final String dialCode,
      final String? emoji,
      required final String code}) = _$PhoneCodeImpl;

  factory _PhoneCode.fromJson(Map<String, dynamic> json) =
      _$PhoneCodeImpl.fromJson;

  @override
  String get name;
  @override
  String get dialCode;
  @override
  String? get emoji;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$PhoneCodeImplCopyWith<_$PhoneCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
