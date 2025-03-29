import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed; 

  const LoginButton({super.key, this.onPressed}); 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => const CircularProgressIndicator(),
          orElse: () => ElevatedButton(
            onPressed: onPressed,
            child: const Text('ورود'),
          ),
        );
      },
    );
  }
}