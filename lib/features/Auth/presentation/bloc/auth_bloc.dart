// lib/features/Auth/presentation/bloc/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/domain/usecases/login.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;

  AuthBloc(this.login) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        login: (email, password) async {
          emit(const AuthState.loading());
          try {
            final result = await login(email, password);
            if (result) {
              emit(const AuthState.success());
            } else {
              emit(const AuthState.error('ایمیل یا رمز عبور اشتباه است'));
            }
          } catch (e) {
            emit(AuthState.error('خطا در ورود: $e'));
          }
        },
      );
    });
  }
}