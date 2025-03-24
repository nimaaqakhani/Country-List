import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/common/widgets/error_state.dart';
import 'package:flutter_application_1/core/common/widgets/loading_list.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_application_1/features/Auth/presentation/bloc/auth_state.dart';
import 'package:flutter_application_1/features/Auth/presentation/widgets/advanced_login_content.dart';

class AdvancedLoginScreen extends StatelessWidget {
  final String successRoute;

  const AdvancedLoginScreen({super.key, required this.successRoute});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const LoadingList(),
                  error: (message) => ErrorState(message: message),
                  orElse: () =>
                      AdvancedLoginContent(successRoute: successRoute),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
