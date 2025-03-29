import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/Auth/data/models/succeed_login_model.dart';

abstract class AuthRepository {
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<SucceedLoginModel>>> login(
      String email, String password);
}
