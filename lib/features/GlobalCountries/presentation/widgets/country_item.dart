import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_constant.dart';

class CountryItem extends StatelessWidget {
  final dynamic country;
  const CountryItem({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppConstants.verticalMargin,
        horizontal: AppConstants.horizontalMargin,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      elevation: AppConstants.elevation,
      child: ListTile(
        contentPadding: const EdgeInsets.all(AppConstants.defaultPadding),
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
                    style: const TextStyle(
                      fontSize: AppConstants.countryNameFontSize,
                      fontFamily: AppConstants.fontFamilyIranSans,
                      fontWeight: AppConstants.countryNameFontWeight,
                    ),
                  ),
                  Text(
                    '${AppConstants.capitalPrefix}${country.capital}',
                    style: const TextStyle(
                      fontSize: AppConstants.countryDetailFontSize,
                      color: Colors.grey,
                      fontFamily: AppConstants.fontFamilyIranSans,
                      fontWeight: AppConstants.countryDetailFontWeight,
                    ),
                  ),
                  if (country.code != null)
                    Text(
                      '${country.code}${AppConstants.codeSuffix}',
                      style: const TextStyle(
                        fontSize: AppConstants.countryDetailFontSize,
                        color: Colors.grey,
                        fontFamily: AppConstants.fontFamilyIranSans,
                        fontWeight: AppConstants.countryDetailFontWeight,
                      ),
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