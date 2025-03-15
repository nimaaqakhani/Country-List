import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/services/api_service.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/datasources/country_remote_data_source.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/repositories/country_repository_impl.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/repositories/country_repository.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  static void init() {
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<ApiService>(() => ApiService());
    getIt.registerLazySingleton<CountryApi>(
        () => CountryApi(getIt<ApiService>()));
    getIt.registerLazySingleton<CountryRepository>(
        () => CountryRepositoryImpl(getIt<CountryApi>()));
    getIt.registerLazySingleton(() => GetCountries(getIt<CountryRepository>()));
  }
}
