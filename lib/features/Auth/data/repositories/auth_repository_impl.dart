// lib/features/Auth/data/repositories/auth_repository_impl.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<bool> login(String email, String password) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/users.json');
      print('JSON loaded successfully: $jsonString');
      final Map<String, dynamic> data = jsonDecode(jsonString);
      final List<dynamic> users = data['users']; // کلید "users" رو بخون
      print('Parsed users: $users');
      for (var user in users) {
        if (user['email'] == email && user['password'] == password) {
          print('Match found: $email, $password');
          return true;
        }
      }
      print('No match found for: $email, $password');
      return false;
    } catch (e) {
      print('Error loading asset: $e');
      rethrow;
    }
  }
}