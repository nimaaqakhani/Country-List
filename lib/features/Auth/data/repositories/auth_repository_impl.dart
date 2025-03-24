import 'package:flutter_application_1/features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_application_1/features/Auth/data/models/user_model.dart';
import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<UserModel>> getUsers() async {
    return await remoteDataSource.fetchUsers();
  }

  @override
  bool validateCredentials(String email, String password) {
    return false;
  }
}