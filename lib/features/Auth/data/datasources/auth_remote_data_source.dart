import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/features/Auth/data/models/user_model.dart';
import 'package:flutter/foundation.dart';

abstract class AuthRemoteDataSource {
  Future<List<UserModel>> fetchUsers();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  static const String _url =
      'https://raw.githubusercontent.com/PouriaMoradi021/users-information/refs/heads/main/user-data.json';

  final http.Client client;

  AuthRemoteDataSourceImpl(this.client);

  @override
  Future<List<UserModel>> fetchUsers() async {
    try {
      debugPrint('AuthRemoteDataSource: Sending GET request to $_url');
      final response = await client.get(Uri.parse(_url)).timeout(
            const Duration(seconds: 10),
            onTimeout: () => throw TimeoutException('Request timed out'),
          );

      debugPrint(
          'AuthRemoteDataSource: Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        debugPrint('AuthRemoteDataSource: Response body: ${response.body}');
        final Map<String, dynamic> data = jsonDecode(response.body);

        final List<dynamic> userList = data['users'] as List<dynamic>;
        debugPrint('AuthRemoteDataSource: Extracted users: $userList');

        return userList
            .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 404) {
        throw Exception('File not found (404)');
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('Network timeout. Please check your connection.');
    } catch (e) {
      debugPrint('AuthRemoteDataSource: Error: $e');
      throw Exception('Network error: $e');
    }
  }
}
