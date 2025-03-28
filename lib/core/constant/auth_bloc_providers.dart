// lib/features/Auth/core/constants/auth_bloc_providers.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/domain/usecases/login.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

/// ## [AuthBlocProviders] Class Documentation
///
/// The [AuthBlocProviders] class is a singleton that provides instances of various authentication-related Blocs used throughout the application.
///
/// ### Usage:
///
/// The [AuthBlocProviders] class is used to create and provide instances of different Blocs required for managing state in authentication-related features.
///
/// ### Constructor:
///
/// The [AuthBlocProviders] class has a private constructor to ensure that it is a singleton.
///
/// ### Example usage:
/// ```dart
/// final authBloc = AuthBlocProviders.authBloc;
/// ```

class AuthBlocProviders {
  AuthBlocProviders._();

  static final BlocProvider<AuthBloc> authBloc = BlocProvider<AuthBloc>(
    create: (_) => GetIt.instance<AuthBloc>(),
  );
}