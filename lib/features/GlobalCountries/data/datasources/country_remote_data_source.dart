import 'package:flutter_application_1/core/services/api_service.dart';
import '../models/country_model.dart';
import 'package:get_it/get_it.dart';

class CountryApi {
  final ApiService _apiService;
  CountryApi(ApiService apiService)
      : _apiService = GetIt.instance<ApiService>();
  Future<List<CountryModel>> fetchCountries() async {
    try {
      final List<dynamic> data = await _apiService.fetchData();
      return data.map((json) => CountryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load countries: $e');
    }
  }
}
