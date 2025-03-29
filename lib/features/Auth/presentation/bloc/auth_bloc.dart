import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/utils/remote_data_state.dart';
import 'package:flutter_application_1/features/Auth/data/models/error_response_model.dart';
import 'package:flutter_application_1/features/Auth/domain/usecases/login_usecase.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';

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
