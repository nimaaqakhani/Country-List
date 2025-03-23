
import 'package:flutter_application_1/features/GlobalCountries/data/datasources/country_remote_data_source.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryApi countryApi;

  CountryRepositoryImpl(this.countryApi);

  @override
  Future<List<CountryModel>> getCountries() async {
    return await countryApi.fetchCountries();
  }
}