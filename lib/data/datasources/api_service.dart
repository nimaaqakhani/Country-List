import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/datasources/api_service_interface.dart';
import 'package:get_it/get_it.dart';

class ApiService implements ApiServiceInterface {
  final Dio _dio = GetIt.instance<Dio>();  
  static const String url =
      'https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json';

  @override
  Future<List<dynamic>> fetchData() async {
    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data =
            response.data is String ? jsonDecode(response.data) : response.data;
        return data;
      } else {
        throw Exception('خطا در دریافت اطلاعات (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('مشکل در اتصال به سرور: $e');
    }
  }
}
