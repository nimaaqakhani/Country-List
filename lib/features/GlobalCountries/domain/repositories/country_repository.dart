import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';

abstract class CountryRepository {
  Future<List<CountryModel>> getCountries();
}