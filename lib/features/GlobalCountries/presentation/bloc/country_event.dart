import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_event.freezed.dart';

/// [CountryEvent] : An event class defining actions for the [CountryBloc].
///
/// This class represents the possible events that can be dispatched to the [CountryBloc] to trigger
/// state changes related to country data. It uses the `freezed` package to generate immutable event
/// types with a clean and concise syntax.
///
/// ### Events:
///
/// - [FetchCountries] :
///   - **Description**: An event that triggers the fetching of country data.
///   - **Parameters**: None
///   - **Usage**: Dispatched to the [CountryBloc] to initiate the retrieval of the country list.
///
/// ### Usage:
///
/// Use this class to define events that the [CountryBloc] can handle. Currently, it supports the [FetchCountries]
/// event, which signals the BLoC to fetch country data from the data layer.
///
@freezed
class CountryEvent with _$CountryEvent {
  const factory CountryEvent.fetchCountries() = FetchCountries;
}