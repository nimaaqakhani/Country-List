import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/models/country_model.dart';

class ApiService {
  final Dio _dio = Dio();

  static const String url =
      'https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json';

  Future<List<CountryModel>> fetchCountries() async {
    try {
      final response = await _dio.get(url);

      print("📡 Status Code: ${response.statusCode}");
      print("📡 Raw Response Data: ${response.data}");

      if (response.statusCode == 200) {
        // ✅ تبدیل response.data از String به JSON قابل پردازش
        List<dynamic> data =
            response.data is String ? jsonDecode(response.data) : response.data;

        print("✅ تعداد کشورها: ${data.length}");

        return data.map((json) => CountryModel.fromJson(json)).toList();
      } else {
        throw Exception('خطا در دریافت اطلاعات (${response.statusCode})');
      }
    } catch (e) {
      print("❌ خطا در دریافت داده‌ها: $e");
      throw Exception('مشکل در اتصال به سرور: $e');
    }
  }
}
