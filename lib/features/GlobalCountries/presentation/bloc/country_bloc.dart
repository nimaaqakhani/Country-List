import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_state.dart';

/// [CountryBloc] : A BLoC class for managing country-related state and events.
///
/// This class handles the business logic for fetching and displaying country data by interacting
/// with the [GetCountries] use case. It processes [CountryEvent]s and emits [CountryState]s to reflect
/// the current state of the country data (e.g., loading, loaded, error) in the UI.
///
/// ### Methods:
///
/// - Constructor:
///   - Initializes the BLoC with a [GetCountries] instance and sets the initial state to [CountryState.initial].
///
/// - Event Handler ([FetchCountries]):
///   - **Parameters**: A [FetchCountries] event to trigger the country data fetch.
///   - **Behavior**: Emits a loading state, fetches data via [GetCountries], and emits either a loaded state with countries or an error state based on the result.
///
/// ### Error Handling:
///
/// - Handles failures from [GetCountries] by emitting an error state with a message from [ErrorResponseModel] if available.
/// - Catches unexpected exceptions and emits a generic error state with the exception details.
///
/// ### Usage:
///
/// Use this BLoC to manage the state of country data in the presentation layer. It listens for [FetchCountries] events,
/// fetches data using the provided [GetCountries] use case, and updates the UI by emitting appropriate [CountryState]s.
///
class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries getCountries;

  CountryBloc(this.getCountries) : super(const CountryState.initial()) {
    on<FetchCountries>((event, emit) async {
      emit(const CountryState.loading());
      try {
        final result = await getCountries();
        result.fold(
          (failure) {
            if (failure is RemoteDataFailed<ErrorResponseModel>) {
              emit(CountryState.error(failure.remoteData.message ?? 'خطا در بارگذاری کشورها'));
            } else {
              emit(const CountryState.error('خطا در بارگذاری کشورها'));
            }
          },
          (success) {
            if (success is RemoteDataSuccess<List<CountryModel>>) {
              emit(CountryState.loaded(success.remoteData));
            } else {
              emit(const CountryState.error('داده‌ها دریافت نشد'));
            }
          },
        );
      } catch (e) {
        emit(CountryState.error('خطای ناشناخته: $e'));
      }
    });
  }
}