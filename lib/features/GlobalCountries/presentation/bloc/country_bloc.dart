import 'package:flutter_application_1/features/GlobalCountries/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries getCountries;

  CountryBloc(this.getCountries) : super(const CountryState.initial()) {
    on<FetchCountries>((event, emit) async {
      emit(const CountryState.loading());
      try {
        final countries = await getCountries();
        emit(CountryState.loaded(countries));
      } catch (e) {
        emit(CountryState.error('خطا در دریافت کشورها: $e'));
      }
    });
  }
}