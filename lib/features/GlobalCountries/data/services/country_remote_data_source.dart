import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/api/api_service.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';

class CountryApi {
  final ApiService _apiService;

  const CountryApi(this._apiService);

  Future<List<CountryModel>> fetchCountries() async {
    try {
      final List<dynamic> data = await _apiService.fetchData();
      debugPrint('CountryService: Raw data: $data');
      final countries = data.map((json) => CountryModel.fromJson(json as Map<String, dynamic>)).toList();
      debugPrint('CountryService: Successfully fetched ${countries.length} countries');
      return countries;
    } catch (e) {
      debugPrint('CountryService: Detailed Error: $e');
      debugPrint('CountryService: Error Type: ${e.runtimeType}');
      throw Exception('خطا در دریافت کشورها: $e');
    }
  }
}