import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/Auth/data/models/succeed_login_model.dart';

/// [AuthRepository] : An abstract class defining authentication operations.
///
/// This repository provides an abstraction for handling user authentication.
/// It declares a method for logging in, which must be implemented by concrete classes.
///
/// ### Methods:
///
/// - [login]:
///   - **Parameters**:
///     - `email`: The user's email address.
///     - `password`: The user's password.
///   - **Returns**:
///     - `Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<SucceedLoginModel>>`
///     - Returns a success response if authentication is successful, otherwise an error.
///
/// ### Usage:
/// ```dart
/// class AuthRepositoryImpl implements AuthRepository {
///   @override
///   Future<Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<SucceedLoginModel>>> login(
///       String email, String password) {
///     // Implementation goes here
///   }
/// }
/// ```
/// Authenticates a user using email and password.
///
/// - **email**: The email address used for login.
/// - **password**: The password used for authentication.
/// - **Returns**: Either a success state with user details or an error state.
abstract class AuthRepository {
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<SucceedLoginModel>>> login(
      String email, String password);
}
