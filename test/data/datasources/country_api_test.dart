
// import 'package:flutter_application_1/features/GlobalCountries/data/datasources/api_service.dart';
// import 'package:flutter_application_1/features/GlobalCountries/data/datasources/country_remote_data_source.dart';
// import 'package:get_it/get_it.dart';
// import 'package:test/test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// @GenerateMocks([ApiService])
// import 'country_api_test.mocks.dart';

// void main() {
//   late CountryApi countryApi;
//   late MockApiService mockApiService;

//   setUp(() {
//     GetIt.instance.reset();
//     mockApiService = MockApiService();
//     GetIt.instance.registerSingleton<ApiService>(mockApiService as ApiService);
//     countryApi = CountryApi(mockApiService as ApiService);
//   });

//   group('CountryApi Tests', () {
//     test('fetchCountries returns list of CountryModel on success', () async {
//       final mockData = [
//         {'name': 'Iran', 'capital': 'Tehran', 'flag': '🇮🇷', 'code': 'IR'},
//         {'name': 'USA', 'capital': 'Washington', 'flag': '🇺🇸', 'code': null},
//       ];
//       when(mockApiService.fetchData()).thenAnswer((_) async => mockData);

//       final result = await countryApi.fetchCountries();
//       expect(result, isA<List<CountryModel>>());
//       expect(result.length, 2);
//       expect(result[0].name, 'Iran');
//       verify(mockApiService.fetchData()).called(1);
//     });

//     test('fetchCountries throws exception on failure', () async {
//       when(mockApiService.fetchData()).thenThrow(Exception('API Error'));

//       expect(
//         () async => await countryApi.fetchCountries(),
//         throwsA(
//           isA<Exception>().having(
//             (e) => e.toString(),
//             'message',
//             contains('Failed to load countries'),
//           ),
//         ),
//       );
//       verify(mockApiService.fetchData()).called(1);
//     });
//   });
// }

// // فرض مدل برای تست
// class CountryModel {
//   final String name;
//   final String capital;
//   final String flag;
//   final String? code;

//   CountryModel({
//     required this.name,
//     required this.capital,
//     required this.flag,
//     this.code,
//   });

//   factory CountryModel.fromJson(Map<String, dynamic> json) {
//     return CountryModel(
//       name: json['name'] as String,
//       capital: json['capital'] as String,
//       flag: json['flag'] as String,
//       code: json['code'] as String?,
//     );
//   }
// }