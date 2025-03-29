import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/constant/app_constant.dart';
import 'package:get_it/get_it.dart';

class ApiService {
  final Dio _dio = GetIt.instance<Dio>();

  Future<List<dynamic>> fetchData() async {
    try {
      debugPrint('ApiService: Fetching from ${AppConstants.countriesUrl}');
      final response = await _dio.get(AppConstants.countriesUrl);
      debugPrint('ApiService: Status Code: ${response.statusCode}');
      debugPrint('ApiService: Raw Response Data: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data =
            response.data is String ? jsonDecode(response.data) : response.data;
        debugPrint('ApiService: Parsed Data: $data');
        return data;
      } else {
        throw Exception('${AppConstants.fetchDataError} (${response.statusCode})');
      }
    } catch (e) {
      debugPrint('ApiService: Error: $e');
      throw Exception('${AppConstants.networkError}: $e');
    }
  }
}