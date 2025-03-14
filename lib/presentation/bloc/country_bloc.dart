import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/entities/country.dart';
import 'package:flutter_application_1/domain/usecases/get_countries.dart';

// Events
abstract class CountryEvent {
  const CountryEvent();
}

class FetchCountries extends CountryEvent {}

// States
abstract class CountryState {
  const CountryState();
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountryLoaded extends CountryState {
  final List<Country> countries;

  const CountryLoaded(this.countries);
}

class CountryError extends CountryState {
  final String message;

  const CountryError(this.message);
}

// BLoC
class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries getCountries;

  CountryBloc(this.getCountries) : super(CountryInitial()) {
    on<FetchCountries>((event, emit) async {
      emit(CountryLoading());
      try {
        final countries = await getCountries();
        emit(CountryLoaded(countries));
      } catch (e) {
        emit(CountryError('خطا در دریافت کشورها: $e'));
      }
    });
  }
}