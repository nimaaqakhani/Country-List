import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/country_bloc.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لیست کشورها', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryInitial || state is CountryLoading) {
              return _buildLoadingList();
            } else if (state is CountryLoaded) {
              return _buildCountryList(state);
            } else if (state is CountryError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
  Widget _buildCountryList(CountryLoaded state) {
    return ListView.builder(
      itemCount: state.countries.length,
      itemBuilder: (context, index) {
        final country = state.countries[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(country.flag, width: 50, height: 50, fit: BoxFit.cover),
            ),
            title: Text(
              country.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              'پایتخت: ${country.capital}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
  Widget _buildLoadingList() {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.blue.shade100,
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
      ),
    );
  }
}
