import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/services/country_remote_data_source.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryApi _countryService;

  CountryRepositoryImpl(this._countryService);

  @override
  Future<Either<RemoteDataState<ErrorResponseModel>, RemoteDataState<List<CountryModel>>>> getCountries() async {
    try {
      final countries = await _countryService.fetchCountries();
      debugPrint('CountryRepositoryImpl: Fetched ${countries.length} countries');
      final successResponse = RemoteDataSuccess<List<CountryModel>>(remoteData: countries);
      return Right(successResponse);
    } on TypeError catch (e, s) {
      debugPrint('TypeError: $e, Stack: $s');
      final errorResponse = ErrorResponseModel(
        message: 'خطای نوع داده: $e',
        statusCode: 500,
      );
      return Left(RemoteDataFailed<ErrorResponseModel>(remoteData: errorResponse));
    } catch (e, s) {
      debugPrint('Unknown Error: $e, Stack: $s');
      final errorResponse = ErrorResponseModel(
        message: 'خطا در دریافت کشورها: $e',
        statusCode: 500,
      );
      return Left(RemoteDataFailed<ErrorResponseModel>(remoteData: errorResponse));
    }
  }
}