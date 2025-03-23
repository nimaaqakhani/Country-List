import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/widgets/country_item.dart';

class CountryList extends StatelessWidget {
  final List<CountryModel> countries;

  const CountryList({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (context, index) {
        return CountryItem(country: countries[index]);
      },
    );
  }
}