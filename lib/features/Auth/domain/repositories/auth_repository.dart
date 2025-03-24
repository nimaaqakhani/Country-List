import 'package:flutter_application_1/features/Auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<List<UserModel>> getUsers();
  bool validateCredentials(String email, String password);
}