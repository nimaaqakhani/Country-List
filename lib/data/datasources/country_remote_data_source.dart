import 'dart:convert'; // برای پارس کردن JSON
import 'package:dio/dio.dart';
import '../models/country_model.dart';

class CountryApi {
  final Dio _dio = Dio();

  Future<List<CountryModel>> fetchCountries() async {
    const url = 'https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json';
    try {
      final response = await _dio.get(url);
      // تبدیل رشته JSON به لیست
      final List<dynamic> data = jsonDecode(response.data as String);
      return data.map((json) => CountryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load countries: $e');
    }
  }
}