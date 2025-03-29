import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/repositories/country_repository.dart';

class GetCountries {
  final CountryRepository repository;

  GetCountries(this.repository);

  Future<Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<List<CountryModel>>>> call() async {
    return await repository.getCountries();
  }
}