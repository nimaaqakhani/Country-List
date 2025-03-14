import 'package:flutter_application_1/data/datasources/country_remote_data_source.dart';
import 'package:flutter_application_1/data/mapper/country_mapper.dart';
import 'package:flutter_application_1/domain/repositories/country_repository.dart';
import '../../domain/entities/country.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryApi countryApi;

  CountryRepositoryImpl(this.countryApi);

  @override
  Future<List<Country>> getCountries() async {
    final countryModels = await countryApi.fetchCountries();
    return CountryMapper.toEntityList(countryModels);
  }
}