// lib/core/injection.dart
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/api/api_service.dart';
import 'package:flutter_application_1/core/api/asset_service.dart';
import 'package:flutter_application_1/features/Auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_application_1/features/Auth/data/services/auth_remote_data_source.dart';
import 'package:flutter_application_1/features/Auth/domain/repositories/auth_repository.dart';
import 'package:flutter_application_1/features/Auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/country_remote_data_source.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/repositories/country_repository_impl.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/repositories/country_repository.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

class Injection {
  static void init() {
    getIt.registerLazySingleton<http.Client>(() => http.Client());
    getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )));

    getIt.registerLazySingleton<AssetService>(() => AssetService());
    getIt.registerLazySingleton<AuthApi>(() => AuthApi(getIt<AssetService>()));
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthApi>()),
    );
    getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(getIt<AuthRepository>()),
    );
    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(getIt<LoginUsecase>()),
    );
    getIt.registerLazySingleton<ApiService>(() => ApiService());
    getIt.registerLazySingleton<CountryApi>(
      () => CountryApi(getIt<ApiService>()),
    );
    getIt.registerLazySingleton<CountryRepository>(
      () => CountryRepositoryImpl(getIt<CountryApi>()),
    );
    getIt.registerLazySingleton<GetCountries>(
      () => GetCountries(getIt<CountryRepository>()),
    );
    getIt.registerFactory<CountryBloc>(
      () => CountryBloc(getIt<GetCountries>()),
    );
  }
}