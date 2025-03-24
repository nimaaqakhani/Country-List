// lib/features/Auth/domain/repositories/auth_repository.dart
abstract class AuthRepository {
  Future<bool> login(String email, String password);
}