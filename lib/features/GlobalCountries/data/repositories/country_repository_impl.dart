import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/services/country_remote_data_source.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/repositories/country_repository.dart';

/// [CountryRepositoryImpl] : A concrete implementation of the [CountryRepository] interface.
///
/// This class is responsible for fetching a list of countries from a remote data source
/// by using the [CountryApi] service. It processes the response into success or error states
/// and handles exceptions that might occur during the request.
///
/// ### Methods:
///
/// - [getCountries] :
///   - Makes a request to retrieve the list of countries from the remote data source.
///   - **Parameters**: None
///   - **Returns**: A `Future` that resolves to an [Either] type, containing either a [RemoteDataState] with [ErrorResponseModel] on the left, or a [RemoteDataState] with [List<CountryModel>] on the right.
///
/// ### Error Handling:
///
/// - `TypeError`: Catches type errors that might occur during data processing and returns a custom error response.
/// - General exceptions: Catches all other exceptions, logs them, and returns an appropriate error model.
///
/// ### Usage:
///
/// Use this class to fetch the list of countries from the server. It processes the response into a list of [CountryModel] objects on success or an [ErrorResponseModel] on failure, with detailed logging for debugging purposes.
///
class CountryRepositoryImpl implements CountryRepository {
  final CountryApi _countryService;

  const CountryRepositoryImpl(this._countryService);

  @override
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<List<CountryModel>>>> getCountries() async {
    try {
      final countries = await _countryService.fetchCountries();
      debugPrint('CountryRepositoryImpl: Fetched ${countries.length} countries');
      final successResponse =
          RemoteDataSuccess<List<CountryModel>>(remoteData: countries);
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