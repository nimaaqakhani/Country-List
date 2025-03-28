// lib/features/Auth/data/services/auth_service.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/api/asset_service.dart';
import 'package:http/http.dart' as http;

/// [AuthService] : A service class responsible for handling authentication requests.
///
/// This class uses [AssetService] to load user data from a local JSON file and simulates
/// an HTTP response for compatibility with the repository layer.
///
/// ### Methods:
///
/// - [request] :
///   - Simulates an authentication request by loading user data from a local JSON asset.
///   - Parameters:
///     - `email` : The user's email address.
///     - `password` : The user's password.
///   - Returns: A `Future` that resolves to an [http.Response] containing the user data or an error.
///
/// ### Usage:
///
/// Use this class to fetch user data for authentication purposes. It simulates an API call by loading data from a local asset.
///
// lib/features/Auth/data/datasources/auth_remote_data_source.dart
import 'package:flutter_application_1/core/api/asset_service.dart';
import 'package:flutter_application_1/features/Auth/data/models/succeed_login_model.dart';

class AuthApi {
  final AssetService _assetService;

  AuthApi(this._assetService);

  Future<http.Response> request({
    required String email,
    required String password,
  }) async {
    try {
      final List<dynamic> users = await _assetService.loadJsonData('assets/data/users.json');
      debugPrint('AuthService: Loaded ${users.length} users from JSON');

      final Map<String, dynamic> responseBody = {
        'users': users,
      };
      final String responseJson = jsonEncode(responseBody);
      
      return http.Response(responseJson, 200);
    } catch (e) {
      debugPrint('AuthService: Error loading JSON: $e');
      final errorBody = jsonEncode({
        'message': 'Failed to load user data: $e',
        'status': 500,
      });
      return http.Response(errorBody, 500);
    }
  }
}