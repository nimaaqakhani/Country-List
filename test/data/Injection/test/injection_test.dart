import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/Di/injection.dart';
import 'package:flutter_application_1/core/services/api_service.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/datasources/country_remote_data_source.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/repositories/country_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    GetIt.instance.reset(); // ریست کردن GetIt قبل از هر تست
    Injection.init(); // ثبت همه وابستگی‌ها
  });

  group('Injection Tests', () {
    test('init registers all dependencies correctly', () {
      expect(getIt<Dio>(), isA<Dio>());
      expect(getIt<ApiService>(), isA<ApiService>());
      expect(getIt<CountryApi>(), isA<CountryApi>());
      expect(getIt<CountryRepository>(), isA<CountryRepository>());
      // اگه هنوز می‌خوای CountryRepositoryImpl رو چک کنی، می‌تونی این خط رو اضافه کنی:
      // expect(getIt<CountryRepository>(), isA<CountryRepositoryImpl>());
    });

    test('singleton dependencies return same instance', () {
      final dio1 = getIt<Dio>();
      final dio2 = getIt<Dio>();
      expect(dio1, same(dio2));
    });
  });
}