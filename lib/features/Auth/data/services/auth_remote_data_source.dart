import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/api/asset_service.dart';
import 'package:http/http.dart' as http;

/// [AuthApi] : Handles authentication requests using local JSON data.
///
/// This class simulates an authentication API by loading user credentials from a local JSON file.
/// Instead of making real HTTP requests, it reads user data from `assets/data/users.json` and returns a response.
///
/// ### Dependencies:
/// - [AssetService]: A service to load JSON data from local assets.
///
/// ### Methods:
///
/// - [request]:
///   - **Parameters**:
///     - `email`: The email provided by the user.
///     - `password`: The password provided by the user.
///   - **Returns**: 
///     - A `Future<http.Response>` containing the user data or an error message.
///   - **Behavior**: Loads users from a JSON file and returns them in an HTTP-like response format.
///
/// ### Exception Handling:
/// - Catches errors while loading the JSON file.
/// - Returns a `500` response if an error occurs.
///
/// ### Usage:
/// ```dart
/// final authApi = AuthApi(assetService);
/// final response = await authApi.request(email: 'test@example.com', password: '123456');
/// print(response.body); // Returns a mock response containing user data.
/// ```
class AuthApi {
  final AssetService _assetService;

  /// Constructor for [AuthApi], requiring an instance of [AssetService].
  AuthApi(this._assetService);

  /// Simulates an authentication request by loading user data from local assets.
  ///
  /// This function fetches users from `assets/data/users.json` and returns a response
  /// containing all users. It does not perform real authentication but serves as a mock API.
  ///
  /// **Returns:**
  /// - A `200 OK` response containing user data if successful.
  /// - A `500 Internal Server Error` response if data loading fails.
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
