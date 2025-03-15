import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/Di/injection.dart';
import 'package:flutter_application_1/core/services/api_service.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/datasources/country_remote_data_source.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/repositories/country_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    GetIt.instance.reset();
  });

  group('Injection Tests', () {
    test('init registers all dependencies correctly', () {
      Injection.init();

      expect(getIt<Dio>(), isA<Dio>());
      expect(getIt<ApiService>(), isA<ApiService>());
      expect(getIt<CountryApi>(), isA<CountryApi>());
      expect(getIt<CountryRepositoryImpl>(), isA<CountryRepositoryImpl>());
    });

    test('singleton dependencies return same instance', () {
      Injection.init();

      final dio1 = getIt<Dio>();
      final dio2 = getIt<Dio>();
      expect(dio1, same(dio2));
    });
  });
}