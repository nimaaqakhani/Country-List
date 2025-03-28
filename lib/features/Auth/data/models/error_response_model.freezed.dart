// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) {
  return _ErrorResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponseModel {
  String? get message => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorResponseModelCopyWith<ErrorResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseModelCopyWith<$Res> {
  factory $ErrorResponseModelCopyWith(
          ErrorResponseModel value, $Res Function(ErrorResponseModel) then) =
      _$ErrorResponseModelCopyWithImpl<$Res, ErrorResponseModel>;
  @useResult
  $Res call({String? message, int? statusCode});
}

/// @nodoc
class _$ErrorResponseModelCopyWithImpl<$Res, $Val extends ErrorResponseModel>
    implements $ErrorResponseModelCopyWith<$Res> {
  _$ErrorResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorResponseModelImplCopyWith<$Res>
    implements $ErrorResponseModelCopyWith<$Res> {
  factory _$$ErrorResponseModelImplCopyWith(_$ErrorResponseModelImpl value,
          $Res Function(_$ErrorResponseModelImpl) then) =
      __$$ErrorResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? statusCode});
}

/// @nodoc
class __$$ErrorResponseModelImplCopyWithImpl<$Res>
    extends _$ErrorResponseModelCopyWithImpl<$Res, _$ErrorResponseModelImpl>
    implements _$$ErrorResponseModelImplCopyWith<$Res> {
  __$$ErrorResponseModelImplCopyWithImpl(_$ErrorResponseModelImpl _value,
      $Res Function(_$ErrorResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? statusCode = freezed,
  }) {
    return _then(_$ErrorResponseModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorResponseModelImpl implements _ErrorResponseModel {
  _$ErrorResponseModelImpl({this.message, this.statusCode});

  factory _$ErrorResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorResponseModelImplFromJson(json);

  @override
  final String? message;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'ErrorResponseModel(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResponseModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResponseModelImplCopyWith<_$ErrorResponseModelImpl> get copyWith =>
      __$$ErrorResponseModelImplCopyWithImpl<_$ErrorResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ErrorResponseModel implements ErrorResponseModel {
  factory _ErrorResponseModel({final String? message, final int? statusCode}) =
      _$ErrorResponseModelImpl;

  factory _ErrorResponseModel.fromJson(Map<String, dynamic> json) =
      _$ErrorResponseModelImpl.fromJson;

  @override
  String? get message;
  @override
  int? get statusCode;
  @override
  @JsonKey(ignore: true)
  _$$ErrorResponseModelImplCopyWith<_$ErrorResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
