// lib/injection/injection.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/datasources/api_service.dart';
import 'package:flutter_application_1/data/datasources/country_remote_data_source.dart';
import 'package:flutter_application_1/data/repositories/country_repository_impl.dart';
import 'package:flutter_application_1/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/domain/repositories/country_repository.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  static void init() {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerLazySingleton(() => CountryApi(getIt<ApiService>()));
    getIt.registerLazySingleton<CountryRepository>(
        () => CountryRepositoryImpl(getIt<CountryApi>()));

    getIt.registerLazySingleton(
        () => GetCountries(getIt<CountryRepository>()));

    // ثبت Bloc
    getIt.registerFactory(() => CountryBloc(getIt<GetCountries>()));
  }
}
