import 'package:flutter/material.dart';
import 'package:flutter_application_1/Di/injection.dart';
import 'package:flutter_application_1/domain/usecases/get_countries.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/presentation/bloc/country_state.dart';
import 'package:flutter_application_1/presentation/widgets/country_list.dart';
import 'package:flutter_application_1/core/widgets/loading_list.dart';
import 'package:flutter_application_1/core/widgets/error_state.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryBloc(getIt<GetCountries>())..add(FetchCountries()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('لیست کشورها',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<CountryBloc, CountryState>(
            builder: (context, state) {
              if (state is CountryLoading) {
                return const LoadingList();
              } else if (state is CountryLoaded) {
                return CountryList(countries: state.countries);
              } else if (state is CountryError) {
                return ErrorState(message: state.message);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
