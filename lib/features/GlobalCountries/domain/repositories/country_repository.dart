import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';

abstract class CountryRepository {
  Future<Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<List<CountryModel>>>> getCountries();
}