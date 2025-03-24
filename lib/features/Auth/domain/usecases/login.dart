import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<bool> call(String email, String password) async {
    final users = await repository.getUsers();
    return users.any((user) => user.email == email && user.password == password);
  }
}