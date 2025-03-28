// lib/features/Auth/data/models/succeed_login_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'succeed_login_model.freezed.dart';
part 'succeed_login_model.g.dart';

/// [SucceedLoginModel] : A data class representing the successful response model for a login attempt.
///
/// This class uses the [freezed] package to generate immutable data classes and unions/sealed classes.
///
/// ### Fields:
///
/// - [statusCode] : The status code of the response. This field is mapped from the JSON key 'status'.
/// - [message] : The message accompanying the response. This field is mapped from the JSON key 'msg'.
/// - [data] : The detailed data of the response, represented by the [LoginData] class. This field is mapped from the JSON key 'data'.
///
/// ### Methods:
///
/// - [SucceedLoginModel.fromJson] : A factory constructor for creating an instance of [SucceedLoginModel] from a JSON map.
///
/// ### Usage:
///
/// Use this class to represent the successful response from the authentication process when a user logs in.
///
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