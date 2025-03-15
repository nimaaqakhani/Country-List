import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/services/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([Dio])
import 'api_service_test.mocks.dart';

void main() {
  late ApiService apiService;
  late MockDio mockDio;

  setUp(() {
    GetIt.instance.reset();
    mockDio = MockDio();
    GetIt.instance.registerSingleton<Dio>(mockDio);
    apiService = ApiService();
  });

  group('ApiService Tests', () {
    test('fetchData returns list of data on success', () async {
      final mockData = [
        {'name': 'Iran'},
        {'name': 'USA'}
      ];
      when(mockDio.get(ApiService.url)).thenAnswer(
        (_) async => Response(
          data: mockData,
          statusCode: 200,
          requestOptions: RequestOptions(path: ApiService.url),
        ),
      );

      final result = await apiService.fetchData();
      expect(result, equals(mockData));
      verify(mockDio.get(ApiService.url)).called(1);
    });

    test('fetchData throws exception on non-200 status', () async {
      when(mockDio.get(ApiService.url)).thenAnswer(
        (_) async => Response(
          data: 'Not Found',
          statusCode: 404,
          requestOptions: RequestOptions(path: ApiService.url),
        ),
      );

      expect(
        () async => await apiService.fetchData(),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('خطا در دریافت اطلاعات (404)'),
          ),
        ),
      );
      verify(mockDio.get(ApiService.url)).called(1);
    });

    test('fetchData throws exception on network error', () async {
      when(mockDio.get(ApiService.url)).thenThrow(DioException(
        requestOptions: RequestOptions(path: ApiService.url),
      ));

      expect(
        () async => await apiService.fetchData(),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('مشکل در اتصال به سرور'),
          ),
        ),
      );
      verify(mockDio.get(ApiService.url)).called(1);
    });
  });
}