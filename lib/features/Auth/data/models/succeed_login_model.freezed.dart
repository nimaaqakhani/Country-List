// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'succeed_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SucceedLoginModel _$SucceedLoginModelFromJson(Map<String, dynamic> json) {
  return _SucceedLoginModel.fromJson(json);
}

/// @nodoc
mixin _$SucceedLoginModel {
  @JsonKey(name: 'status')
  int? get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'msg')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  LoginData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SucceedLoginModelCopyWith<SucceedLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SucceedLoginModelCopyWith<$Res> {
  factory $SucceedLoginModelCopyWith(
          SucceedLoginModel value, $Res Function(SucceedLoginModel) then) =
      _$SucceedLoginModelCopyWithImpl<$Res, SucceedLoginModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? statusCode,
      @JsonKey(name: 'msg') String? message,
      @JsonKey(name: 'data') LoginData? data});

  $LoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SucceedLoginModelCopyWithImpl<$Res, $Val extends SucceedLoginModel>
    implements $SucceedLoginModelCopyWith<$Res> {
  _$SucceedLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $LoginDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SucceedLoginModelImplCopyWith<$Res>
    implements $SucceedLoginModelCopyWith<$Res> {
  factory _$$SucceedLoginModelImplCopyWith(_$SucceedLoginModelImpl value,
          $Res Function(_$SucceedLoginModelImpl) then) =
      __$$SucceedLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int? statusCode,
      @JsonKey(name: 'msg') String? message,
      @JsonKey(name: 'data') LoginData? data});

  @override
  $LoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SucceedLoginModelImplCopyWithImpl<$Res>
    extends _$SucceedLoginModelCopyWithImpl<$Res, _$SucceedLoginModelImpl>
    implements _$$SucceedLoginModelImplCopyWith<$Res> {
  __$$SucceedLoginModelImplCopyWithImpl(_$SucceedLoginModelImpl _value,
      $Res Function(_$SucceedLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$SucceedLoginModelImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SucceedLoginModelImpl implements _SucceedLoginModel {
  _$SucceedLoginModelImpl(
      {@JsonKey(name: 'status') this.statusCode,
      @JsonKey(name: 'msg') this.message,
      @JsonKey(name: 'data') this.data});

  factory _$SucceedLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SucceedLoginModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int? statusCode;
  @override
  @JsonKey(name: 'msg')
  final String? message;
  @override
  @JsonKey(name: 'data')
  final LoginData? data;

  @override
  String toString() {
    return 'SucceedLoginModel(statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SucceedLoginModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SucceedLoginModelImplCopyWith<_$SucceedLoginModelImpl> get copyWith =>
      __$$SucceedLoginModelImplCopyWithImpl<_$SucceedLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SucceedLoginModelImplToJson(
      this,
    );
  }
}

abstract class _SucceedLoginModel implements SucceedLoginModel {
  factory _SucceedLoginModel(
      {@JsonKey(name: 'status') final int? statusCode,
      @JsonKey(name: 'msg') final String? message,
      @JsonKey(name: 'data') final LoginData? data}) = _$SucceedLoginModelImpl;

  factory _SucceedLoginModel.fromJson(Map<String, dynamic> json) =
      _$SucceedLoginModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  int? get statusCode;
  @override
  @JsonKey(name: 'msg')
  String? get message;
  @override
  @JsonKey(name: 'data')
  LoginData? get data;
  @override
  @JsonKey(ignore: true)
  _$$SucceedLoginModelImplCopyWith<_$SucceedLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return _LoginData.fromJson(json);
}

/// @nodoc
mixin _$LoginData {
  @JsonKey(name: 'userId')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDataCopyWith<LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res, LoginData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') String? userId,
      @JsonKey(name: 'email') String? email});
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res, $Val extends LoginData>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginDataImplCopyWith<$Res>
    implements $LoginDataCopyWith<$Res> {
  factory _$$LoginDataImplCopyWith(
          _$LoginDataImpl value, $Res Function(_$LoginDataImpl) then) =
      __$$LoginDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') String? userId,
      @JsonKey(name: 'email') String? email});
}

/// @nodoc
class __$$LoginDataImplCopyWithImpl<$Res>
    extends _$LoginDataCopyWithImpl<$Res, _$LoginDataImpl>
    implements _$$LoginDataImplCopyWith<$Res> {
  __$$LoginDataImplCopyWithImpl(
      _$LoginDataImpl _value, $Res Function(_$LoginDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? email = freezed,
  }) {
    return _then(_$LoginDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDataImpl implements _LoginData {
  _$LoginDataImpl(
      {@JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'email') this.email});

  factory _$LoginDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDataImplFromJson(json);

  @override
  @JsonKey(name: 'userId')
  final String? userId;
  @override
  @JsonKey(name: 'email')
  final String? email;

  @override
  String toString() {
    return 'LoginData(userId: $userId, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      __$$LoginDataImplCopyWithImpl<_$LoginDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDataImplToJson(
      this,
    );
  }
}

abstract class _LoginData implements LoginData {
  factory _LoginData(
      {@JsonKey(name: 'userId') final String? userId,
      @JsonKey(name: 'email') final String? email}) = _$LoginDataImpl;

  factory _LoginData.fromJson(Map<String, dynamic> json) =
      _$LoginDataImpl.fromJson;

  @override
  @JsonKey(name: 'userId')
  String? get userId;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
