import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:go_router/go_router.dart';

class LoginStatus extends StatelessWidget {
  final String successRoute;

  const LoginStatus({super.key, required this.successRoute});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () => context.go(successRoute),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          success: () => const Text('Login successful!', style: TextStyle(color: Colors.green)),
          error: (message) => Text(message, style: const TextStyle(color: Colors.red)),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}