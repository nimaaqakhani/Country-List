import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constant/app_constant.dart';
import 'package:flutter_application_1/core/services/api_service_interface.dart';
import 'package:get_it/get_it.dart';
class ApiService implements ApiServiceInterface {
  final Dio _dio = GetIt.instance<Dio>();
  @override
  Future<List<dynamic>> fetchData() async {
    try {
      final response = await _dio.get(AppConstants.countriesUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data =
            response.data is String ? jsonDecode(response.data) : response.data;
        return data;
      } else {
        throw Exception('${AppConstants.fetchDataError} (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('${AppConstants.networkError}: $e');
    }
  }
}