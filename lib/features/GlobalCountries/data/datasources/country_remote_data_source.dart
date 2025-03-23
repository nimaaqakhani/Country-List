import 'package:flutter_application_1/core/services/api_service.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';

class CountryApi {
  final ApiService _apiService;

  CountryApi(this._apiService);

  Future<List<CountryModel>> fetchCountries() async {
    try {
      final List<dynamic> data = await _apiService.fetchData();
      return data.map((json) => CountryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load countries: $e');
    }
  }
}