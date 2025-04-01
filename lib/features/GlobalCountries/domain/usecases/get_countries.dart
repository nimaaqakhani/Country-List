import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/data/models/country_model.dart';
import 'package:flutter_application_1/features/GlobalCountries/domain/repositories/country_repository.dart';

/// [GetCountries] : A use case class for retrieving the list of countries.
///
/// This class encapsulates the business logic for fetching country data by delegating the request
/// to a [CountryRepository]. It serves as an abstraction layer between the data layer and the presentation layer,
/// following the Clean Architecture pattern.
///
/// ### Methods:
///
/// - [call] :
///   - Executes the use case to fetch the list of countries.
///   - **Parameters**: None
///   - **Returns**: A `Future` that resolves to an [Either] type, containing either a [RemoteDataState] with [ErrorResponseModel] on the left (failure), or a [RemoteDataState] with [List<CountryModel>] on the right (success).
///
/// ### Usage:
///
/// Use this class to fetch country data in a clean and modular way. It relies on an injected [CountryRepository] instance to perform the actual data retrieval, making it easy to test and maintain.
///
class GetCountries {
  final CountryRepository repository;

  const GetCountries(this.repository);

  Future<
      Either<RemoteDataState<ErrorResponseModel>,
          RemoteDataState<List<CountryModel>>>> call() async {
    return await repository.getCountries();
  }
}