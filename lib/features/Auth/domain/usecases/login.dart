// lib/features/Auth/domain/usecases/login.dart
import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<bool> call(String email, String password) async {
    return await repository.login(email, password);
  }
}