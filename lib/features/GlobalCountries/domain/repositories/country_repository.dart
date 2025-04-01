import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';

/// [CountryRepository] : An abstract interface defining the contract for country data retrieval.
///
/// This interface specifies the method required to fetch country data from a data source.
/// Implementing classes (e.g., [CountryRepositoryImpl]) must provide the concrete logic for retrieving
/// the list of countries and handling success or error states.
///
/// ### Methods:
///
/// - [getCountries] :
///   - Defines a method to fetch the list of countries.
///   - **Parameters**: None
///   - **Returns**: A `Future` that resolves to an [Either] type, containing either a [RemoteDataState] with [ErrorResponseModel] on the left (failure), or a [RemoteDataState] with [List<CountryModel>] on the right (success).
///
/// ### Usage:
///
/// Use this interface to enforce a consistent contract for country data retrieval across different implementations. It ensures that any class implementing this interface provides a method to fetch countries and returns the data in a standardized format.
///
abstract class CountryRepository {
  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<List<CountryModel>>>> getCountries();
}