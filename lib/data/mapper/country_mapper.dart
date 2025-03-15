import '../models/country_model.dart';
import '../../domain/entities/country.dart';

class CountryMapper {
  static Country toEntity(CountryModel model) {
    return Country(
      name: model.name,
      capital: model.capital,
      flag: model.flag,
      code: model.code,
    );
  }
  static List<Country> toEntityList(List<CountryModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}