import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country_bloc.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لیست کشورها')),
      body: BlocBuilder<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryInitial || state is CountryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CountryLoaded) {
            return ListView.builder(
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final country = state.countries[index];
                return ListTile(
                  leading: Image.network(country.flag, width: 50, height: 50),
                  title: Text(country.name),
                  subtitle: Text('پایتخت: ${country.capital}'),
                );
              },
            );
          } else if (state is CountryError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}