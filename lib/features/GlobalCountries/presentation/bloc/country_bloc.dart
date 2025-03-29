import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/usecases/get_countries.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_event.dart';
import 'package:flutter_application_1/features/GlobalCountries/presentation/bloc/country_state.dart';

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