import 'package:flutter_application_1/data/datasources/api_service.dart';
import '../models/country_model.dart';

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