import 'package:flutter/material.dart';

class CountryItem extends StatelessWidget {
  final dynamic country;
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
                  Text(country.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'IRANSans',
                        fontWeight: FontWeight.w900,
                      )),
                  Text('پایتخت: ${country.capital}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontFamily: 'IRANSans',
                        fontWeight: FontWeight.w500,
                      )),
                  if (country.code != null)
                    Text(' ${country.code} :کد',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: 'IRANSans',
                          fontWeight: FontWeight.w500,
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
