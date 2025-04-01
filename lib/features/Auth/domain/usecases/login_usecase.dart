import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/Auth/data/models/succeed_login_model.dart';
import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';

/// [LoginUsecase] : A use case for handling the login operation.
///
/// This class acts as an intermediary between the UI and the repository layer.
/// It takes the user credentials (email and password) and calls the repository to authenticate the user.
/// The result of the login attempt is returned as an [Either] type, indicating either success or failure.
///
/// ### Dependencies:
/// - [AuthRepository]: A repository responsible for authenticating users.
///
/// ### Methods:
///
/// - [call]:
///   - **Parameters**:
///     - `email`: The user's email address for authentication.
///     - `password`: The user's password for authentication.
///   - **Returns**:
///     - `Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<SucceedLoginModel>>`
///     - This method returns either a successful login response or an error response.
///
/// ### Usage:
/// ```dart
/// final loginUsecase = LoginUsecase(authRepository);
/// final result = await loginUsecase.call('test@example.com', 'password123');
/// result.fold(
///   (error) => handleError(error),  // Handle error
///   (data) => handleSuccess(data),  // Handle success
/// );
/// ```
/// Constructor for [LoginUsecase], requiring an instance of [AuthRepository].
/// Executes the login operation by calling the [AuthRepository].
///
/// - **email**: The email address provided by the user.
/// - **password**: The password provided by the user.
/// - **Returns**:
///   - A `Future` with either a `RemoteDataState<ErrorResponseModel>` (if login fails) or a `RemoteDataState<SucceedLoginModel>` (if login succeeds).
class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<SucceedLoginModel>>> call(
      String email, String password) async {
    return await repository.login(email, password);
  }
}
