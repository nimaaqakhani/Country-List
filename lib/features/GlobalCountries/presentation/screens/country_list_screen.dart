import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_bloc.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_state.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/widgets/country_list.dart';
import 'package:flutter_application_1/core/common/widgets/loading_list.dart';
import 'package:flutter_application_1/core/common/widgets/error_state.dart';

/// [CountryListScreen] : A stateless widget that displays a list of countries.
///
/// This widget serves as the main screen for showing country data fetched by the [CountryBloc].
/// It uses [BlocBuilder] to listen to [CountryState] changes and renders appropriate UI components
/// based on the current state (e.g., loading, loaded, error).
///
/// ### Methods:
///
/// - [build] :
///   - **Parameters**: `context` - The [BuildContext] for building the widget.
///   - **Returns**: A [Scaffold] widget containing an [AppBar] and a body with dynamic content based on [CountryState].
///   - **Behavior**: Renders a loading indicator, a list of countries, an error message, or a default message depending on the state.
///
/// ### UI Components:
///
/// - **AppBar**: Displays the title "لیست کشورها" with centered text and slight elevation.
/// - **Body**: Uses [BlocBuilder] to switch between:
///   - [LoadingList] for the loading state.
///   - [CountryList] for the loaded state with country data.
///   - [ErrorState] for the error state with a message.
///   - A fallback [Text] widget for unhandled states.
///
/// ### Usage:
///
/// Use this widget as a screen to display country data managed by the [CountryBloc]. It reacts to state changes
/// and provides a user-friendly interface for viewing the list of countries or handling errors.
///
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