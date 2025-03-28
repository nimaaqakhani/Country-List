// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'succeed_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SucceedLoginModelImpl _$$SucceedLoginModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SucceedLoginModelImpl(
      statusCode: (json['status'] as num?)?.toInt(),
      message: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SucceedLoginModelImplToJson(
        _$SucceedLoginModelImpl instance) =>
    <String, dynamic>{
      'status': instance.statusCode,
      'msg': instance.message,
      'data': instance.data,
    };

_$LoginDataImpl _$$LoginDataImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataImpl(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$LoginDataImplToJson(_$LoginDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
    };
