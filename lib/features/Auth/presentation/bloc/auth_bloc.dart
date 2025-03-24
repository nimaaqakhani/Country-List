import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/domain/usecases/login.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_event.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter/foundation.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;

  AuthBloc(this.login) : super(const AuthState.initial()) {
    on<LoginEvent>((event, emit) async {
      emit(const AuthState.loading());
      debugPrint('AuthBloc: Starting login with email: ${event.email}');
      try {
        debugPrint('AuthBloc: Calling login use case');
        final isValid = await login(event.email, event.password);
        debugPrint('AuthBloc: Login result: $isValid');
        if (isValid) {
          debugPrint('AuthBloc: Emitting success state');
          emit(const AuthState.success());
        } else {
          debugPrint('AuthBloc: Emitting error state - Invalid credentials');
          emit(const AuthState.error('Invalid email or password'));
        }
      } catch (e) {
        debugPrint('AuthBloc: Error occurred: $e');
        emit(AuthState.error('Login failed: $e'));
      }
    });
  }
}