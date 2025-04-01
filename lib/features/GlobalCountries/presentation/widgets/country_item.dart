import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';

/// [CountryItem] : A stateless widget that displays information for a single country.
///
/// This widget renders a card containing details of a country, such as its flag, name, capital,
/// and code (if available), based on a provided [CountryModel]. It is designed to be used within
/// a list, such as in the [CountryList] widget.
///
/// ### Properties:
///
/// - `country` :
///   - **Type**: [CountryModel]
///   - **Description**: The country data to be displayed, required for rendering the widget.
///
/// ### Methods:
///
/// - [build] :
///   - **Parameters**: `context` - The [BuildContext] for building the widget.
///   - **Returns**: A [Card] widget containing a [ListTile] with the country's details.
///   - **Behavior**: Constructs a card with a flag image, name, capital, and code (if present), styled for visual appeal.
///
/// ### UI Components:
///
/// - **Card**: A container with rounded corners and elevation for a raised effect.
/// - **ListTile**: Displays the country details in a structured layout:
///   - **Flag**: An [Image.network] widget showing the country's flag, with an error fallback.
///   - **Name**: A bold [Text] widget displaying the country's name.
///   - **Capital**: A [Text] widget showing the capital, styled in grey.
///   - **Code**: An optional [Text] widget showing the country code, styled in grey, displayed only if available.
///
/// ### Usage:
///
/// Use this widget to display individual country information within a list. It takes a [CountryModel]
/// as input and presents the data in a visually appealing card format, with error handling for the flag image.
///
class CountryItem extends StatelessWidget {
  final CountryModel country;

  const CountryItem({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                country.flag,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50, color: Colors.red);
                },
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    country.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Capital: ${country.capital}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  if (country.code != null)
                    Text(
                      'Code: ${country.code}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}