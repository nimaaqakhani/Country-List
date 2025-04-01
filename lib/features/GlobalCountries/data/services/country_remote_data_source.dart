import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/api/api_service.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';

/// [CountryApi] : A service class responsible for fetching country data from the server.
///
/// This class uses the [ApiService] to retrieve raw country data from a remote API.
/// It processes the raw data into a list of [CountryModel] objects and provides detailed
/// debugging logs for monitoring the fetch process.
///
/// ### Methods:
///
/// - [fetchCountries] :
///   - Makes a request to fetch the list of countries from the server.
///   - **Parameters**: None
///   - **Returns**: A `Future` that resolves to a [List<CountryModel>] containing the fetched countries.
///   - **Throws**: An [Exception] with a custom message if an error occurs during the fetch process.
///
/// ### Error Handling:
///
/// - General exceptions: Catches all exceptions, logs detailed error information, and throws a custom exception with a descriptive message.
///
/// ### Usage:
///
/// Use this class to retrieve country data from the server. It converts raw API data into a list of [CountryModel] objects and provides detailed logs for debugging purposes. Typically called by a repository like [CountryRepositoryImpl].
///
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