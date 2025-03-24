import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/common/widgets/error_state.dart';
import 'package:flutter_application_1/core/common/widgets/loading_list.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/modern_login_content.dart';

class ModernLoginScreen extends StatelessWidget {
  final String successRoute;

  const ModernLoginScreen({super.key, required this.successRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
              Theme.of(context).colorScheme.secondary.withOpacity(0.6),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const LoadingList(),
                  error: (message) => ErrorState(message: message),
                  orElse: () => ModernLoginContent(successRoute: successRoute),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}