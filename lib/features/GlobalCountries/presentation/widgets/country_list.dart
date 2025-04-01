import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/widgets/country_item.dart';

/// [CountryList] : A stateless widget that displays a scrollable list of countries.
///
/// This widget takes a list of [CountryModel] objects and renders each one as a [CountryItem] using
/// a [ListView.builder]. It is designed to efficiently display a dynamic number of countries in a scrollable format.
///
/// ### Properties:
///
/// - `countries` :
///   - **Type**: [List<CountryModel>]
///   - **Description**: The list of country data to be displayed, required for rendering the widget.
///
/// ### Methods:
///
/// - [build] :
///   - **Parameters**: `context` - The [BuildContext] for building the widget.
///   - **Returns**: A [ListView.builder] widget that generates [CountryItem]s for each country in the list.
///   - **Behavior**: Constructs a scrollable list where each item is a [CountryItem] based on the provided [countries] list.
///
/// ### UI Components:
///
/// - **ListView.builder**: A scrollable list that dynamically builds [CountryItem] widgets:
///   - **itemCount**: Determined by the length of the `countries` list.
///   - **itemBuilder**: Creates a [CountryItem] for each country using its index in the list.
///
/// ### Usage:
///
/// Use this widget to display a list of countries in a scrollable format. It takes a [List<CountryModel>]
/// as input and renders each country as a [CountryItem], making it ideal for showing fetched country data in the UI.
///
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