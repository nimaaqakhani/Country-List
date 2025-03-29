import 'package:freezed_annotation/freezed_annotation.dart';

part 'succeed_login_model.freezed.dart';
part 'succeed_login_model.g.dart';

@freezed
class SucceedLoginModel with _$SucceedLoginModel {
  factory SucceedLoginModel({
    @JsonKey(name: 'status') int? statusCode,
    @JsonKey(name: 'msg') String? message,
    @JsonKey(name: 'data') LoginData? data,
  }) = _SucceedLoginModel;

  factory SucceedLoginModel.fromJson(Map<String, dynamic> json) =>
      _$SucceedLoginModelFromJson(json);
}

@freezed
class LoginData with _$LoginData {
  factory LoginData({
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'email') String? email,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
}