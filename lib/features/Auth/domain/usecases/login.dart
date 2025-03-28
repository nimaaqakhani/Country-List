// lib/features/Auth/domain/usecases/login.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/Auth/data/models/succeed_login_model.dart';
import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<SucceedLoginModel>>> call(
      String email, String password) async {
    return await repository.login(email, password);
  }
}