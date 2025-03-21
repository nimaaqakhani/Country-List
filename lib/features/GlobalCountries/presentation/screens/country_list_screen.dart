import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_state.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/widgets/country_list.dart';
import 'package:flutter_application_1/core/common/widgets/loading_list.dart';
import 'package:flutter_application_1/core/common/widgets/error_state.dart';
class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return state.maybeWhen(
              loading: () => const LoadingList(),
              loaded: (countries) => CountryList(countries: countries),
              error: (message) => ErrorState(message: message),
              orElse: () => const Center(child: Text('وضعیت نامشخص')),
            );
          },
        ),
      ),
    );
  }
}