// lib/features/GlobalCountries/core/constants/country_bloc_providers.dart
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:get_it/get_it.dart';

/// ## [CountryBlocProviders] Class Documentation
///
/// The [CountryBlocProviders] class is a singleton that provides instances of various country-related Blocs used throughout the application.
///
/// ### Usage:
///
/// The [CountryBlocProviders] class is used to create and provide instances of different Blocs required for managing state in country-related features.
///
/// ### Constructor:
///
/// The [CountryBlocProviders] class has a private constructor to ensure that it is a singleton.
///
/// ### Example usage:
/// ```dart
/// final countryBloc = CountryBlocProviders.countryBloc;
/// ```

class CountryBlocProviders {
  CountryBlocProviders._();

  static final BlocProvider<CountryBloc> countryBloc = BlocProvider<CountryBloc>(
    create: (_) => GetIt.instance<CountryBloc>()..add(const FetchCountries()),
  );
}