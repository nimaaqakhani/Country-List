import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_state.freezed.dart';

/// [CountryState] : A state class representing the UI states for country data in the [CountryBloc].
///
/// This class defines the possible states of the country data fetching process, used by the [CountryBloc]
/// to communicate with the presentation layer. It uses the `freezed` package to generate immutable state
/// types with a clean and concise syntax.
///
/// ### States:
///
/// - [CountryInitial] :
///   - **Description**: The initial state before any action is taken.
///   - **Parameters**: None
///
/// - [CountryLoading] :
///   - **Description**: Indicates that country data is being fetched.
///   - **Parameters**: None
///
/// - [CountryLoaded] :
///   - **Description**: Represents a successful fetch with the list of countries.
///   - **Parameters**: `countries` - A [List<CountryModel>] containing the fetched country data.
///
/// - [CountryError] :
///   - **Description**: Indicates an error occurred during the fetch process.
///   - **Parameters**: `message` - A [String] describing the error.
///
/// ### Usage:
///
/// Use this class to represent the state of country data in the UI. The [CountryBloc] emits these states
/// to reflect the current status of the data fetching process (e.g., initial, loading, loaded, or error).
///
@freezed
class CountryState with _$CountryState {
  const factory CountryState.initial() = CountryInitial;
  const factory CountryState.loading() = CountryLoading;
  const factory CountryState.loaded(List<CountryModel> countries) = CountryLoaded;
  const factory CountryState.error(String message) = CountryError;
}