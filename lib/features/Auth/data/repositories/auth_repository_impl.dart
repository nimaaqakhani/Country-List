// lib/features/Auth/data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/Auth/data/models/succeed_login_model.dart';
import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// ## [AuthRepositoryImpl] Class Documentation
///
/// The [AuthRepositoryImpl] class implements the [AuthRepository] interface and provides the implementation for authenticating a user.
///
/// ### Usage:
///
/// The [AuthRepositoryImpl] class is used to authenticate users by making a request to the [AuthService].
///
/// ### Properties:
///
/// - [_service] : An instance of [AuthService] used to make the request.
///
/// ### Constructor:
///
/// The constructor takes an instance of [AuthService] as a parameter.
///
/// ### Methods:
///
/// - [login] : This method takes `email` and `password` as input and returns a [Future] containing either a [RemoteDataState] of [ErrorResponseModel] or [SucceedLoginModel].
///
/// ### Method Details:
///
/// #### `Future<Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<SucceedLoginModel>>> login(String email, String password)`
///
/// This method authenticates a user by making a request to the [AuthService] with the provided `email` and `password`.
/// It handles the response by checking the status code and parsing the data into either a [SucceedLoginModel] or an [ErrorResponseModel].
/// It also handles various exceptions such as [http.ClientException], [TypeError], and other general exceptions, logging them and returning appropriate failure responses.
///
/// ### Example usage:
/// ```dart
/// final authService = AuthService(assetService);
/// final repository = AuthRepositoryImpl(authService);
/// final result = await repository.login(email: 'user@example.com', password: 'password123');
///
/// result.fold(
///   (failure) => print('Error: ${failure.remoteData}'),
///   (success) => print('Success: ${success.remoteData}'),
/// );
/// ```
class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<SucceedLoginModel>>> login(
      String email, String password) async {
    try {
      final response = await _authApi.request(email: email, password: password);

      if (response.statusCode == 200) {
        final List<dynamic> users = jsonDecode(response.body)['users'];
        for (var userJson in users) {
          final user = userJson as Map<String, dynamic>;
          if (user['email'] == email && user['password'] == password) {
            final data = SucceedLoginModel(
              statusCode: 200,
              message: 'ورود با موفقیت انجام شد',
              data: LoginData(userId: user['id']?.toString(), email: email),
            );
            final successResponse = RemoteDataSuccess<SucceedLoginModel>(remoteData: data);
            return Right(successResponse);
          }
        }
        final errorResponse = ErrorResponseModel(
          message: 'ایمیل یا رمز عبور اشتباه است',
          statusCode: 401,
        );
        final failureResponse = RemoteDataFailed<ErrorResponseModel>(remoteData: errorResponse);
        return Left(failureResponse);
      } else {
        final errorResponse = ErrorResponseModel(
          message: 'خطا در درخواست: ${response.statusCode}',
          statusCode: response.statusCode,
        );
        final failureResponse = RemoteDataFailed<ErrorResponseModel>(remoteData: errorResponse);
        return Left(failureResponse);
      }
    } on http.ClientException catch (e, s) {
      debugPrint('ClientException: $e, Stack: $s');
      final errorResponse = ErrorResponseModel(
        message: 'خطای شبکه: $e',
        statusCode: 500,
      );
      return Left(RemoteDataFailed<ErrorResponseModel>(remoteData: errorResponse));
    } on TypeError catch (e, s) {
      debugPrint('TypeError: $e, Stack: $s');
      final errorResponse = ErrorResponseModel(
        message: 'خطای نوع داده: $e',
        statusCode: 500,
      );
      return Left(RemoteDataFailed<ErrorResponseModel>(remoteData: errorResponse));
    } catch (e, s) {
      debugPrint('Unknown Error: $e, Stack: $s');
      final errorResponse = ErrorResponseModel(
        message: 'خطای ناشناخته: $e',
        statusCode: 500,
      );
      return Left(RemoteDataFailed<ErrorResponseModel>(remoteData: errorResponse));
    }
  }
}