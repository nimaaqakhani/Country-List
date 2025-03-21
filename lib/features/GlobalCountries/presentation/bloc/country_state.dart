import 'package:flutter_application_1/features/GlobalCountries/domain/entities/country.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_state.freezed.dart';

@freezed
class CountryState with _$CountryState {
  const factory CountryState.initial() = CountryInitial;
  const factory CountryState.loading() = CountryLoading;
  const factory CountryState.loaded(List<Country> countries) = CountryLoaded;
  const factory CountryState.error(String message) = CountryError;
}