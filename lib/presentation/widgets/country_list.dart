import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/country_item.dart';

class CountryList extends StatelessWidget {
  final List<dynamic> countries;
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
