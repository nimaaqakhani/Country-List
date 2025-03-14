import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart'; 
import 'package:flutter_application_1/data/datasources/api_service.dart'; 
import 'package:flutter_application_1/data/datasources/country_remote_data_source.dart';
import 'package:flutter_application_1/data/repositories/country_repository_impl.dart';
import 'package:flutter_application_1/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/presentation/screens/country_list_screen.dart';

void main() {
  runApp(const MyApp()); 
}
class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    final dio = Dio(); 
    final apiService = ApiService(dio); 
    final countryApi = CountryApi(apiService); 
    final repository = CountryRepositoryImpl(countryApi);
    final getCountries = GetCountries(repository);

    return MaterialApp(
      home: BlocProvider(
        create: (context) => CountryBloc(getCountries)..add(FetchCountries()),
        child: const CountryListScreen(), 
      ),
    );
  }
}