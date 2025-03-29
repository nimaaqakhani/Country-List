import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/api/asset_service.dart';
import 'package:http/http.dart' as http;

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