import 'package:flutter_application_1/features/GlobalCountries/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries getCountries;
  CountryBloc(GetCountries getCountries)
      : getCountries = GetIt.instance<GetCountries>(),
        super(CountryInitial()) {
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
