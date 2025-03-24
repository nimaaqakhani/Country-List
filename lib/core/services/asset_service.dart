import 'dart:convert';
import 'package:flutter/services.dart';

class AssetService {
  Future<List<dynamic>> loadJsonData(String assetPath) async {
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> data = jsonDecode(jsonString);
      final List<dynamic> jsonList = data['users'];
      return jsonList;
    } catch (e) {
      throw Exception('Failed to load JSON data: $e');
    }
  }
}