// lib/core/utils/remote_data_state.dart
abstract class RemoteDataState<T> {
  const RemoteDataState();
}

class RemoteDataSuccess<T> extends RemoteDataState<T> {
  final T remoteData;

  const RemoteDataSuccess({required this.remoteData});
}

class RemoteDataFailed<T> extends RemoteDataState<T> {
  final T remoteData;

  const RemoteDataFailed({required this.remoteData});
}