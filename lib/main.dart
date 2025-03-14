import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/datasources/country_remote_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/repositories/country_repository_impl.dart';
import 'domain/usecases/get_countries.dart';
import 'presentation/bloc/country_bloc.dart';
import 'presentation/screens/country_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryApi = CountryApi();
    final repository = CountryRepositoryImpl(countryApi);
    final getCountries = GetCountries(repository);

    return MaterialApp(
      home: BlocProvider(
        create: (context) => CountryBloc(getCountries)..add(FetchCountries()),
        child: CountryListScreen(),
      ),
    );
  }
}