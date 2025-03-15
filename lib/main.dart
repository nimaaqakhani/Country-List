import 'package:flutter/material.dart';
import 'package:flutter_application_1/Di/injection.dart';
import 'package:flutter_application_1/presentation/bloc/country_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/presentation/screens/country_list_screen.dart';
import 'package:flutter_application_1/presentation/bloc/country_bloc.dart';

void main() {
  Injection.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CountryBloc>(
        create: (context) => getIt<CountryBloc>()..add(FetchCountries()),
        child: const CountryListScreen(),
      ),
    );
  }
}
