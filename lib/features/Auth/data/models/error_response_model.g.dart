// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorResponseModelImpl _$$ErrorResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ErrorResponseModelImpl(
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ErrorResponseModelImplToJson(
        _$ErrorResponseModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
