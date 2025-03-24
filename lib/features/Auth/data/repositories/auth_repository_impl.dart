import 'package:flutter_application_1/features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<bool> login(String email, String password) async {
    return await _authApi.login(email, password);
  }
}
