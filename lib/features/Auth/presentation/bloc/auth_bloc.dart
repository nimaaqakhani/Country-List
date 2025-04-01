import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/Auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';

/// [AuthBloc] : A BLoC that handles authentication events and manages authentication state.
///
/// This class is responsible for managing the state of the authentication process.
/// It listens for authentication-related events, such as login attempts, and updates the state accordingly.
/// The BLoC uses the [LoginUsecase] to attempt login, and emits loading, success, or error states.
///
/// ### Dependencies:
/// - [LoginUsecase]: A use case responsible for executing the login operation.
///
/// ### Methods:
///
/// - [on<AuthEvent>]:
///   - **Parameters**:
///     - `event`: The authentication event that triggers state changes.
///     - `emit`: A function used to emit new states.
///
///   - **Behavior**:
///     - When a login event is received, it triggers the login process by calling the [LoginUsecase].
///     - During the login process, it emits a loading state, then either a success or error state based on the result.
///
/// ### Usage:
/// ```dart
/// final authBloc = AuthBloc(loginUsecase);
/// authBloc.add(AuthEvent.login(email: 'test@example.com', password: 'password123'));
/// ```
/// Constructor for [AuthBloc], requiring an instance of [LoginUsecase].

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase login;

  AuthBloc(this.login) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        login: (email, password) async {
          emit(const AuthState.loading());
          try {
            final result = await login(email, password);
            result.fold(
              (failure) => emit(AuthState.error(
                  (failure as RemoteDataFailed<ErrorResponseModel>)
                          .remoteData
                          .message ??
                      'خطا در ورود')),
              (success) => emit(const AuthState.success()),
            );
          } catch (e) {
            emit(AuthState.error('خطای ناشناخته: $e'));
          }
        },
      );
    });
  }
}
