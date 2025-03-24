import 'package:flutter_application_1/core/services/asset_service.dart';
import 'package:flutter_application_1/features/Auth/data/models/user_model.dart';

class AuthApi {
  final AssetService _assetService;
  AuthApi(this._assetService);
  Future<bool> login(String email, String password) async {
    try {
      final List<dynamic> users = await _assetService.loadJsonData('assets/data/users.json');
      for (var userJson in users) {
        final user = UserModel.fromJson(userJson as Map<String, dynamic>);
        if (user.email == email && user.password == password) {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}