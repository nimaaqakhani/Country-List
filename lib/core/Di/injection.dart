import 'package:flutter_application_1/core/di/injection_imports.dart';
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
