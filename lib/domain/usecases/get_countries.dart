// lib/domain/usecases/get_countries.dart
import '../repositories/country_repository.dart';
import '../entities/country.dart';

class GetCountries {
  final CountryRepository repository;

  GetCountries(this.repository);

  Future<List<Country>> call() async {
    return await repository.getCountries();
  }
}
