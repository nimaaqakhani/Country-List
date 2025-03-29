import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
class AuthBlocProviders {
  AuthBlocProviders._();

  static final BlocProvider<AuthBloc> authBloc = BlocProvider<AuthBloc>(
    create: (_) => GetIt.instance<AuthBloc>(),
  );
}