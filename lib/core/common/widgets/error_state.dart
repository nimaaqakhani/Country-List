import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';

class ErrorState extends StatelessWidget {
  final String message;
  const ErrorState({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 60, color: Colors.red),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.red),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CountryBloc>(context).add(FetchCountries());
            },
            child: const Text(AppConstants.retryButtonText), 
          ),
        ],
      ),
    );
  }
}